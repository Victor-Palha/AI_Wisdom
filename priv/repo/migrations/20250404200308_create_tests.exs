defmodule AiWisdom.Repo.Migrations.CreateTests do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
