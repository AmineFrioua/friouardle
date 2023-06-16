defmodule Friouardle.Wordle do
  alias FriouardleWeb.Components.Game
  alias Friouardle.{Wordle, Repo}
  alias Friouardle.Wordle.{GameSession, Words}
  import Ecto.Query, warn: false

  def get_random_word(type \\ "english", size \\ 5) do
    query =
      from d in Words,
        where: d.word_length == ^size,
        where: d.type == ^type,
        select: d.word_letters

    Repo.one(query)
  end

  def create_word(attrs \\ %{}) do
    %Words{}
    |> Words.changeset(attrs)
    |> Repo.insert()
  end

  def get_word(id) do
    Repo.get(Words, id)
  end

  def update_word(%Words{} = dict, attrs) do
    dict
    |> Words.changeset(attrs)
    |> Repo.update()
  end

  def delete_word(%Words{} = dict) do
    Repo.delete(dict)
  end

  def list_words do
    Repo.all(Words)
  end

  ## Main Wordle functions
  @spec game_session(type :: String.t(), size :: pos_integer()) :: GameSession.t()
  def game_session(type \\ "english", size \\ 5) do
    correct_word = get_random_word(type, size)

    %GameSession{
      correct_word: correct_word,
      tries_allowed: length(correct_word),
      number_of_tries: 0,
      number_of_letters: 0,
      game_status: {:not_started, "Good Luck hope you guess it"}
    }
  end

  @spec guess(try_word :: [String.t()], correct_word :: [String.t()]) :: [
          {String.t(), String.t()}
        ]
  def guess(try_word, correct_word) do
    try_word
    |> Enum.with_index()
    |> Enum.map(fn {letter, index} ->
      if Enum.at(correct_word, index) == letter do
        {letter, :green}
      else
        if letter in correct_word do
          {letter, :yellow}
        else
          {letter, :red}
        end
      end
    end)
  end
end
