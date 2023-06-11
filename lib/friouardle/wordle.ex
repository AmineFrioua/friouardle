defmodule Friouardle.Wordle do
  alias Friouardle.Repo
  alias Friouardle.Wordle.Words
  import Ecto.Query, warn: false

  def get_random_word(type \\ "english", size \\ 5) do
    query =
      from d in Words,
        where: d.word_length == ^size,
        where: d.type == ^type,
        select: d.word

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

  # we assume that we did our test so these 2 words have the same length so we will not worry about this
  # for now
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
