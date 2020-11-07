defmodule Servy.HttpClient do

  def send_request(request) do

    host = 'localhost'
    {:ok, client_socket} =
      :gen_tcp.connect(host, 4000, [:binary, packet: :raw, active: false])

    :ok = :gen_tcp.send(client_socket, request)
    {:ok, response} = :gen_tcp.recv(client_socket, 0)
    :ok = :gen_tcp.close(client_socket)
    response
  end

  def make_request do
    request = """
    GET /api/bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = send_request(request)
    IO.puts(response)
  end
end
