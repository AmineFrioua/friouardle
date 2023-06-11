defmodule FriouardleWeb.GameSession do
  use FriouardleWeb, :live_view
  alias Friouardle.Wordle

  def mount(_params, _session, socket) do
    game_session = Wordle.game_session()

    array= generate_empty_tries ( game_session.tries_allowed)

    socket = assign(socket, game_session: game_session, array: array)
    {:ok, socket}
  end

  defp generate_empty_tries(n) do
    {" ", :a}
    |> List.duplicate(n)
    |> List.duplicate(n)
    |> Enum.with_index(1)
    |> IO.inspect()
  end
end
