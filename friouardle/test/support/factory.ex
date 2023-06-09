defmodule Friouardle.Factory do
  alias Friouardle.Repo

  def build(:dictonary) do
    %Friouardle.Wordle.Dictonary{
      word: "apple",
      world_length: 5,
      word_letters: ['a', 'p', 'p', 'l', 'e'],
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
