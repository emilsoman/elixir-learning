defmodule LinkedProcesses do
  def start(_type, _args) do
    {:ok, pid} = Task.start_link fn -> link_processes end
    Process.register(pid, :self)
    {:ok, pid}
  end

  def link_processes do
    {:ok, pid1} = Task.start_link fn -> listen("process1") end
    {:ok, pid2} = Task.start_link fn -> listen("process2") end
    Process.register(pid1, :process1)
    Process.register(pid2, :process2)
    listen("parent")
  end

  def listen(name) do
    receive do
      :kill ->
        raise "#{name} going down"
    end
  end

  def kill_process1 do
    send :process1, :kill
  end

  def kill_process2 do
    send :process2, :kill
  end

  def kill_self do
    send :self, :kill
  end
end
