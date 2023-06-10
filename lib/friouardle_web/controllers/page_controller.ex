defmodule FriouardleWeb.PageController do
  use FriouardleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
