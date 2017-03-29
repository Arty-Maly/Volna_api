defmodule VolnaApi.ProspectTest do
  use VolnaApi.ModelCase

  alias VolnaApi.Prospect

  @valid_attrs %{email: "a@a.com"}
  @invalid_attrs %{email: "blablabala"}

  test "changeset with valid attributes" do
    changeset = Prospect.changeset(%Prospect{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Prospect.changeset(%Prospect{}, @invalid_attrs)
    refute changeset.valid?
  end
end
