defmodule VolnaApi.Prospect do
  use VolnaApi.Web, :model

  schema "prospects" do
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
    |> validate_email
  end

  defp validate_email(changeset) do
    email = get_field(changeset, :email)
    if Regex.match?(~r/.+@.+/, email) do
      changeset
    else
      add_error(changeset, :error, "email incorrect")
    end
  end
end
