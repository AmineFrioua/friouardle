defmodule FriouardleWeb.Components.Game.Keyboard do
  use FriouardleWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div class="flex justify-center mb-1">
        <%= for k <- String.graphemes("QWERTYUIOP") do %>
          <button class="flex items-center bg-slate-400 justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none dark:text-white h-6 ">
            <%= k %>
          </button>
        <% end %>
      </div>
      <div class="flex justify-center mb-1">
        <%= for k <- String.graphemes("ASDFGHJKL") do %>
          <button class="flex items-center bg-slate-400 justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none dark:text-white h-6 ">
            <%= k %>
          </button>
        <% end %>
      </div>
      <div class="flex justify-center mb-1">
        <button class="flex items-center bg-slate-400 justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none dark:text-white h-6 ">
          <%= "ENTER" %>
        </button>
        <%= for k <- String.graphemes("ZXCVBNM")  do %>
          <button class="flex items-center bg-slate-400 justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none dark:text-white h-6 ">
            <%= k %>
          </button>
        <% end %>
        <button class="flex items-center bg-slate-400 justify-center rounded mx-0.5 px-1.5 text-xs font-bold cursor-pointer select-none dark:text-white h-6 ">
          <%= "DEL" %>
        </button>
      </div>
    </div>
    """
  end
end
