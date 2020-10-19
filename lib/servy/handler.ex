defmodule Servy.Handler do
  def handler(request) do
    # conv = parse(request)
    # conv = route(conv)
    # format_response(conv)
    request
    |> parse
    |> route
    |> format_response
  end

  def parse(request) do
    [method, path, _] = 
      request
      |> String.split("\n") 
      |> List.first
      |> String.split(" ")

    %{ method: method, path: path, resp_body: "" }
  end

  def route(_request) do
    _conv = %{ method: "GET", path: "/wildthings", resp_body: "Bears, Lions, Tigers" }
  end

  def format_response(_conv) do
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: 20

    Bears, Lions, Tigers
    """
  end
end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handler(request)
IO.puts response