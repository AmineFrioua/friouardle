defmodule FriouardleWeb.GameSession do
  use FriouardleWeb, :live_view
  alias Friouardle.Wordle

  def mount(_params, _session, socket) do
    game_session = Wordle.game_session()

    array = generate_empty_tries(game_session.tries_allowed)

    socket = assign(socket, game_session: game_session, array: array)
    {:ok, socket}
  end

  def handle_event("press_key", %{"value" => key}, socket) do
    game_session = socket.assigns.game_session
    array = socket.assigns.array
    array = check_position_and_validate(game_session, array, key)

    game_session =
      Map.update(game_session, :number_of_letters, 0, fn existing_value -> existing_value + 1 end)

    socket = assign(socket, game_session: game_session, array: array)
    {:noreply, socket}
  end

  def handle_event("press_key", %{"key" => key}, socket) do
    game_session = socket.assigns.game_session
    array = socket.assigns.array
    array = check_position_and_validate(game_session, array, key)

    game_session =
      Map.update(game_session, :number_of_letters, 0, fn existing_value -> existing_value + 1 end)

    socket = assign(socket, game_session: game_session, array: array)
        {:noreply, socket}
  end

  defp update_game_session(game_session) do
    tries_allowed= game_session.tries_allowed
    number_of_letters=game_session.number_of_letters
    number_of_tries= game_session.number_of_tries
  end

  defp check_position_and_validate(game_session, array, key) do
    word =
      array
      |> Enum.at(game_session.number_of_tries)
      |> List.update_at(game_session.number_of_letters, fn _ -> {key, :a} end)

    List.update_at(array, game_session.number_of_tries, fn _ -> word end)
  end

  defp generate_empty_tries(n) do
    {" ", :a}
    |> List.duplicate(n)
    |> List.duplicate(n)
  end
end
