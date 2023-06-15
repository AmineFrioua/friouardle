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

    %{game_session: game_session, array: array} =
      case guess_or_not(game_session) do
        :guess -> guess(game_session, array)
        :continue -> check_position_and_validate(game_session, array, key)
      end

    socket = assign(socket, game_session: game_session, array: array)
    {:noreply, socket}
  end

  def handle_event("press_key", %{"key" => key}, socket) do
    game_session = socket.assigns.game_session
    array = socket.assigns.array

    %{game_session: game_session, array: array} =
      case guess_or_not(game_session) do
        :guess -> guess(game_session, array)
        :continue -> check_position_and_validate(game_session, array, key)
      end

    socket = assign(socket, game_session: game_session, array: array)
    {:noreply, socket}
  end

  def guess_or_not(game_session) do
    IO.inspect(game_session)
    tries_allowed = game_session.tries_allowed
    number_of_letters = game_session.number_of_letters
    number_of_tries = game_session.number_of_tries

    result = if tries_allowed == number_of_letters, do: :guess, else: :continue
    IO.inspect(result)
    if tries_allowed == number_of_tries, do: :finish, else: result
    result
  end

  def check_position_and_validate(game_session, array, key) do
    word =
      array
      |> Enum.at(game_session.number_of_tries)
      |> List.update_at(game_session.number_of_letters, fn _ -> {key, :a} end)

    game_session =
      Map.update(game_session, :number_of_letters, 0, fn existing_value -> existing_value + 1 end)

    array = List.update_at(array, game_session.number_of_tries, fn _ -> word end)

    %{game_session: game_session, array: array}
  end

  def guess(game_session, array) do
    guess =
      array
      |> Enum.at(game_session.number_of_tries)
      |> Enum.map(fn {letter, _} -> letter end)

    word = Wordle.guess(guess, game_session.correct_word)
    array = List.update_at(array, game_session.number_of_tries, fn _ -> word end)

    game_session =
      Map.update(game_session, :number_of_tries, 0, fn existing_value -> existing_value + 1 end)

    %{game_session: game_session, array: array}
  end

  defp generate_empty_tries(n) do
    {" ", :a}
    |> List.duplicate(n)
    |> List.duplicate(n)
  end
end
