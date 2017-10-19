defmodule Blockchain do
  Module.register_attribute __MODULE__,
    :node_id, accumulate: false, persist: true

  @node_id UUID.uuid4(:hex)

  def start_link do
    blockchain = %{
      chain: [],
      current_transactions: [],
      last_block: nil
    }

    Agent.start_link(fn -> blockchain end, name: __MODULE__)
    new_block(100, 0)
  end

  def index do
    Agent.get(__MODULE__, &(&1))
  end

  def new_block(proof, previous_hash) do
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
        %{blockchain | chain: [] ++ chain ++ [block], last_block: block}
      end
    )

    block
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

  def mine do
    current_state = index()
    chain = current_state[:chain]
    current_transactions = current_state[:current_transactions]
    last_block = current_state[:last_block]
    last_proof = last_block[:proof]
    previous_hash = last_block[:previous_hash]
    proof = proof_of_work(last_proof)

    new_transaction(
      %{
        sender: "0",
        recipient: @node_id,
        amount: 1
      }
    )

    new_block(proof, nil)
  end

  defp proof_of_work(last_proof) do
    work(last_proof, 0)
  end

  defp work(last_proof, proof) do
    binary_guess = Integer.to_string(last_proof) <> Integer.to_string(proof) <> <<0>>

    <<guess::binary-size(5), _::binary>> =
      :crypto.hash(:sha, binary_guess)
      |> Base.encode16

    guess
    |> case do
      "00000" -> proof
      _ -> work(last_proof, proof + 1)
    end
  end

  defp hash(block) do
    :crypto.hash(:sha256, Poison.encode!(block))
    |> Base.encode16
  end
end
