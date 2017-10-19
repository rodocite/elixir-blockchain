defmodule Start do
  import Blockchain

  def start(_, _) do
    IO.puts("starting server - localhost:4000")
    Blockchain.start_link
  end
end
