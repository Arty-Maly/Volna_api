defmodule VolnaApi.Repo.Migrations.AddCountryToRadioStations do
  use Ecto.Migration
  alias VolnaApi.RadioStation
  alias VolnaApi.Repo

  def up do
    alter table(:radio_stations) do
      add :country, :string
    end
    flush
    create index(:radio_stations, [:country])
    drop index(:radio_stations, [:position])
    drop index(:radio_stations, [:name])
    create unique_index(:radio_stations, [:country, :position])
    create unique_index(:radio_stations, [:name, :country])
    Repo.update_all(RadioStation, set: [country: "ru"])

    alter table(:radio_stations) do
      modify :country, :string, null: false
    end
  end

  def down do
    alter table(:radio_stations) do
      remove :country
    end
  end
end
