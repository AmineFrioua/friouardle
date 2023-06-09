defmodule Friouardle.Wordle do
  alias Friouardle.Repo
  alias Friouardle.Wordle.Dictionary
  import Ecto.Query, warn: false

  def get_random_word(type \\ "english", size \\ 5) do
    query =
      from d in Dictionary,
        where: d.word_length == ^size,
        where: d.type == ^type,
        select: d.word

    Repo.one(query)
  end

  def create_dictionary(attrs \\ %{}) do
    %Dictionary{}
    |> Dictionary.changeset(attrs)
    |> Repo.insert()
  end

  def get_dictionary(id) do
    Repo.get(Dictionary, id)
  end

  def update_dictionary(%Dictionary{} = dict, attrs) do
    dict
    |> Dictionary.changeset(attrs)
    |> Repo.update()
  end

  def delete_dictionary(%Dictionary{} = dict) do
    Repo.delete(dict)
  end

  def list_dictionaries do
    Repo.all(Dictionary)
  end
end
