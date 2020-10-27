defmodule Servy.BearController do

  alias Servy.Wildthings

  def index(conv) do
    bears = Wildthings.list_bears()
    # TODO: Transform bears to an HTML list
    %{ conv | status: 200, resp_body: "<ul><li>#{bears[0].name}</li></ul>" }
  end

  def show(conv, %{ "id" => id }) do
    %{ conv | status: 200, resp_body: "Bears #{id}" }
  end

  def create(conv, %{ "name" => name, "type" => type } = _params) do
    %{ conv | status: 201,
              resp_body: "Create a #{type} bear names #{name}!" }
  end
end
