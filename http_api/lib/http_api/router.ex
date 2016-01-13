defmodule HttpApi.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello Plug!")
  end

  match _ do
    send_resp(conn, 404, "Nothing here")
  end
end
