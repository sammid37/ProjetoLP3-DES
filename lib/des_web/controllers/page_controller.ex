defmodule DesWeb.PageController do
  use DesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
