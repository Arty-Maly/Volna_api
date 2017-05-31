defmodule VolnaApi.Repo.Migrations.CreateProspect do
  use Ecto.Migration

  def change do
    create table(:prospects) do
      add :email, :string
      timestamps()
    end
  end
end
