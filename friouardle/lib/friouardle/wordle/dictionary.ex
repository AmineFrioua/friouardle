defmodule Friouadle.Dictionary do
  use Ecto.Schema

  schema "dictionary" do
    field :word, :string
    field :word_length, :integer
    field :word_letters, {:array, :char}
    field :type, :string

    timestamps()
  end

  def changeset(dict, params \\ %{}) do
    dict
    |> cast(params, [:word, :word_length, :word_letters, :type])
    |> validate_required([:word, :word_length, :word_letters, :type])
    |> validate_length(:word, min: 4)
    |> validate_length(:word_letters, min: 4)
  end
end
