defmodule Friouardle.Factory do
  alias Friouardle.Repo

  def build(:words) do
    %Friouardle.Wordle.Words{
      word: "apple",
      word_length: 5,
      word_letters: ["a", "p", "p", "l", "e"],
      type: "english"
    }
  end

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
