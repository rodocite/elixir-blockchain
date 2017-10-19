defmodule Blockchain do
  def start_link do
    genesis_block = %{
      chain: [
        %{
          index: 1,
          previous_hash: 1,
          timestamp: ~T[13:07:22.145373],
          transactions: []
        }
      ],
      current_transactions: []
    }

    Agent.start_link(fn -> genesis_block end, name: __MODULE__)
  end

  def new_block(previous_hash \\ nil, proof=100) do
    current_state = Agent.get(__MODULE__, &(&1))
    chain = current_state[:chain]
    previous_block = List.last(chain)

    block = %{
      index: length(chain) + 1,
      proof: proof,
      timestamp: Time.utc_now,
      transactions: current_state.current_transactions,
      previous_hash: previous_hash || hash(previous_block)
    }

    __MODULE__ |>
    Agent.update(
      fn blockchain ->
        chain = blockchain[:chain]
        %{blockchain | chain: [] ++ chain ++ [block]}
      end
    )
  end

  def new_transaction(transaction) do
    __MODULE__ |>
    Agent.update(
      fn blockchain ->
        current_transactions = blockchain[:current_transactions]
        %{blockchain | current_transactions: [] ++ current_transactions ++ [transaction]}
      end
    )
  end

  def proof_of_work(last_proof) do
    work(last_proof, 0)
  end

  def check do
    IO.inspect Agent.get(__MODULE__, &(&1))
  end

  defp work(last_proof, proof) do
    binary_guess = Integer.to_string(last_proof) <> Integer.to_string(proof) <> <<0>>

    <<guess::binary-size(4), _::binary>> =
      :crypto.hash(:sha, binary_guess)
      |> Base.encode16

    guess
    |> case do
      "0000" -> {:ok, proof}
      _ -> work(last_proof, proof + 1)
    end
  end

  defp hash(block) do
    :crypto.hash(:sha256, Poison.encode!(block))
    |> Base.encode16
  end
end
