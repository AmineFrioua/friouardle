defmodule Friouardle.Wordle.GameSession do
  use TypedStruct

  @moduledoc """
  A structure that holds the game session data
  """

  typedstruct do
    field :correct_word, String.t(), defualt: ["a", "m", "i", "n", "e"]
    field :tries_allowed, pos_integer(), default: 0
    field :number_of_tries, pos_integer(), default: 0
    field :number_of_letters, pos_integer(), default: 0
    field :game_status, {atom(), String.t()}, default: {:ongoing, "Insert word"}
  end
end
