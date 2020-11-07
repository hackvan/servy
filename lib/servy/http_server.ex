defmodule Servy.HttpServer do
  # Elixir Example of gen_tcp:
  # server() ->
  #   {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0},
  #                                       {active, false}]),
  #   {ok, Sock} = gen_tcp:accept(LSock),
  #   {ok, Bin} = do_recv(Sock, []),
  #   ok = gen_tcp:close(Sock),
  #   ok = gen_tcp:close(LSock),
  #   Bin.

  def server do
    { :ok, listen_socket } = :gen_tcp.listen(5678, [:binary, packet: 0, active: false])
    { :ok, socket } = :gen_tcp.accept(listen_socket)
    { :ok, bin } = :gen_tcp.recv(socket, 0)
    :ok = :gen_tcp.close(socket)
    :ok = :gen_tcp.close(listen_socket)
    bin
  end
end
