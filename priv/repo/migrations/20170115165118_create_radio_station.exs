defmodule VolnaApi.Repo.Migrations.CreateRadioStation do
  use Ecto.Migration

  def up do
    create table(:radio_stations) do
      add :name, :string
      add :url, :string
      add :image, :string


      timestamps()
    end
  end


  def down do
    drop table(:radio_stations)
  end
end
