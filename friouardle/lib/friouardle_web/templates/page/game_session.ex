defmodule FriouardleWeb.GameSession do
  use FriouardleWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
