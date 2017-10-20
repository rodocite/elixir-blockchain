defmodule Router do
  use Plug.Router
  plug :match
  plug :dispatch

  get "/" do
    response = Poison.encode! Blockchain.index()[:chain]
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, response)
  end

  get "/mine" do
    response = Poison.encode! Blockchain.mine()
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, response)
  end

  # post "/register-nodes" do
  # end

  # get "/resolve-nodes" do
  # end

  match _ do
    conn
    |> send_resp(404, "404")
  end
end
