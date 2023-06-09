defmodule Friouardle.Repo.Migrations.CreateDictonaryTable do
  use Ecto.Migration

  def change do
    create table(:dictionary) do
      add :word, :string
      add :word_length, :integer
      add :word_letters, {:array, :string}
      add :type, :string
    end
  end
end
