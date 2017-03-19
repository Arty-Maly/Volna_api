defmodule VolnaApi.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def up do
    create table(:devices) do
      add :uuid, :string
      add :need_sync, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:devices, [:uuid])
  end

  def down do
    drop table(:radio_stations)
  end
end
