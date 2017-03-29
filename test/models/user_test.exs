defmodule VolnaApi.UserTest do
  use VolnaApi.ModelCase

  alias VolnaApi.User

  @valid_attrs %{email: "a@a", password_hash: "some content"}
  @invalid_attrs %{email: 1231, password_hash: "some content"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
