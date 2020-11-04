defmodule ParserTest do
  use ExUnit.Case

  alias Servy.Parser

  test "parser a list of header fields into a map" do
    header_lines = ["A: 1", "B: 2", "C: 3"]

    headers = Parser.parse_headers(header_lines)

    assert headers == %{ "A" => "1", "B" => "2", "C" => "3" }
  end
end
