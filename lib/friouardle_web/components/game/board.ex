defmodule FriouardleWeb.Components.Game.Board do
  use FriouardleWeb, :live_component
  alias FriouardleWeb.Helpers.GameHelper

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div class="flex justify-center mb-1">
        <%= for {letter, value} <- @word do %>
          <label class={"flex items-center border border-black justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none #{GameHelper.case_color(value)}"}>
            <%= letter %>
          </label>
        <% end %>
      </div>
    </div>
    """
  end
end
