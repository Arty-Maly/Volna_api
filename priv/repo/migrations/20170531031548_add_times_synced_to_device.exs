defmodule VolnaApi.Repo.Migrations.AddTimesSyncedToDevice do
  use Ecto.Migration

  def up do
    alter table(:devices) do
      add :times_synced, :integer, default: 1
    end
    flush
  end

  def down do
    alter table(:devices) do
      remove :times_synced
    end
  end
end