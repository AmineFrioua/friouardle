defmodule Friouardle.Wordle.GameSessionTest do
  use Friouardle.DataCase
  alias Friouardle.Wordle.GameSession

  describe "GameSession" do
    test "struct has correct fields" do
      session = %GameSession{}

      assert Map.has_key?(session, :correct_word)
      assert Map.has_key?(session, :tries_allowed)
      assert Map.has_key?(session, :number_of_tries)
      assert Map.has_key?(session, :number_of_letters)
      assert Map.has_key?(session, :game_status)
    end

    test "struct has correct types" do
      session = %Friouardle.Wordle.GameSession{
        correct_word: ["word"],
        tries_allowed: 5,
        number_of_tries: 0,
        number_of_letters: 5,
        game_status: {:ongoing, "Game in progress"}
      }

      assert is_map(session)
      assert is_list(session.correct_word)
      assert is_integer(session.tries_allowed)
      assert is_integer(session.number_of_tries)
      assert is_integer(session.number_of_letters)
      assert is_tuple(session.game_status)
      assert is_atom(elem(session.game_status, 0))
      assert is_binary(elem(session.game_status, 1))
    end
  end
end
