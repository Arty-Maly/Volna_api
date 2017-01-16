defmodule VolnaApi.Device do
  use VolnaApi.Web, :model

  schema "devices" do
    field :uuid, :string
    field :need_sync, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uuid, :need_sync])
    |> validate_required([:uuid, :need_sync])
  end
end
