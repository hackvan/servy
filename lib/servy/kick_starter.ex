defmodule Servy.KickStarter do
  use GenServer

  # server_pid = Process.whereis(:http_server)
  # Process.exit(server_pid, :kaboom)
  # Process.alive?(server_pid)
  # Process.info(server_pid, :links)

  def start do
    IO.puts "Starting the kickstarter..."
    GenServer.start(__MODULE__, :ok, name: __MODULE__)
  end

  def get_server do
    GenServer.call(__MODULE__, :get_server)
  end

  def init(:ok) do
    Process.flag(:trap_exit, true)
    server_pid = start_server()
    {:ok, server_pid}
  end

  def handle_call(:get_server, _from, state) do
    {:reply, state, state}
  end

  def handle_info({:EXIT, _pid, reason}, _state) do
    IO.puts "HttpServer exited (#{inspect reason})"
    server_pid = start_server()
    {:noreply, server_pid}
  end

  defp start_server do
    IO.puts "Starting the HTTP server..."
    # server_pid = spawn(Servy.HttpServer, :start, [4000])
    # Process.link(server_pid)
    server_pid = spawn_link(Servy.HttpServer, :start, [4000])
    Process.register(server_pid, :http_server)
    server_pid
  end
end
