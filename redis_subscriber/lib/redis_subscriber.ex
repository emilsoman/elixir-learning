defmodule RedisSubscriber do
  def start(_type, _args) do
    Task.start_link fn -> bootstrap end
  end

  defp bootstrap do
    init_redis_connection |> sub("test")
  end

  defp init_redis_connection do
    {:ok, connection} = Redix.PubSub.start_link
    connection
  end

  defp sub(connection, channel) do
    :ok = Redix.PubSub.subscribe(connection, channel, self())
    listen_on_channel
  end

  defp listen_on_channel do
    receive do
      {:redix_pubsub, :message, msg, channel} -> IO.puts msg
    end
    listen_on_channel
  end
end
