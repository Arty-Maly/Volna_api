defmodule VolnaApi.Repo.Migrations.AddPositionToRadioStations do
  use Ecto.Migration

  def up do
    alter table(:radio_stations) do
      add :position, :string
    end

    create unique_index(:radio_stations, [:name])
    create unique_index(:radio_stations, [:position])
  end

  def down do
    alter table(:radio_stations) do
      remove :position
    end
  end
end
