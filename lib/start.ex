defmodule Start do
  def start(_, _) do
    Blockchain.start_link
    Plug.Adapters.Cowboy.http(Router, [])
  end
end
