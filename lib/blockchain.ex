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

  def new_block(previous_hash \\ nil) do
    current_state = Agent.get(__MODULE__, &(&1))
    chain = current_state[:chain]
    previous_block = List.last(chain)

    block = %{
      index: length(chain) + 1,
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

  def hash(block) do
    :crypto.hmac(:sha256, "so fsecure, bro", Poison.encode!(block))
    |> Base.encode64
  end
end

# Blockchain.start_link()
# Blockchain.new_transaction(%{
#   recipient: "Rodo",
#   sender: "Su",
#   amount: 1
# })
# Blockchain.new_block()
# Blockchain.new_transaction(%{
#   recipient: "Su",
#   sender: "Rodo",
#   amount: 10
# })
# Blockchain.new_block()
# Blockchain.new_transaction(%{
#   recipient: "Serra",
#   sender: "Molly",
#   amount: 1
# })
# Blockchain.new_block()
