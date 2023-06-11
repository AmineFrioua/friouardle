defmodule Friouardle.Repo.Migrations.CreateWordsTable do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word, :string
      add :word_length, :integer
      add :word_letters, {:array, :string}
      add :type, :string
    end

  end
end
