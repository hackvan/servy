defmodule Servy.FileHandler do
  alias Servy.Conv

  @db_path Path.expand("db", File.cwd!)

  def handle_file({ :ok, content }, %Conv{} = conv) do
    %{ conv | status: 200, resp_body: content }
  end

  def handle_file({ :error, :enoent }, %Conv{} = conv) do
    %{ conv | status: 404, resp_body: "File not found!" }
  end

  def handle_file({ :error, reason }, %Conv{} = conv) do
    %{ conv | status: 500, resp_body: "File error: #{reason}" }
  end

  def read_json_file(filename) do
    @db_path
    |> Path.join(filename)
    |> read_json
  end

  defp read_json(source) do
    case File.read(source) do
      {:ok, contents}  ->
        contents
      {:error, reason} ->
        IO.inspect "Error reading #{source}: #{reason}"
        "[]"
    end
  end
end
