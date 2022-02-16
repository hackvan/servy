defmodule Servy do
  use Application

  def start(_type, _args) do
    IO.puts "Starting the application..."
    Servy.Supervisor.start_link()
  end
end

# IO.puts Servy.hello("Diego")
# Application.started_applications()
# Application.stop(:servy)
# Application.start(:servy)

# iex -S mix
# mix run --no-halt

# cat _build/dev/lib/servy/ebin/servy.app
