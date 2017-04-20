defmodule VolnaApi.RadioStationTest do
  use VolnaApi.ModelCase

  alias VolnaApi.RadioStation

  @valid_attrs %{name: "Radio", url: "www", image: "abc", position: "1"}
  @invalid_attrs %{name: 123, url: 123, image: 123, position: 123}
  @missing_attrs %{name: nil, url: nil, position: nil, image: nil}

  test "changeset with valid attributes" do
    changeset = RadioStation.changeset(%RadioStation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RadioStation.changeset(%RadioStation{}, @invalid_attrs)

    assert changeset.errors[:name] == {"is invalid", [type: :string, validation: :cast]}
    assert changeset.errors[:url] == {"is invalid", [type: :string, validation: :cast]}
    assert changeset.errors[:image] == {"is invalid", [type: :string, validation: :cast]}
    assert changeset.errors[:position] == {"is invalid", [type: :string, validation: :cast]}
  end

  test "changeset with missing attributes" do
    changeset = RadioStation.changeset(%RadioStation{}, @missing_attrs)

    assert changeset.errors[:name] == {"Missing Requires Params", [validation: :required]}
    assert changeset.errors[:url] == {"Missing Requires Params", [validation: :required]}
    assert changeset.errors[:position] == {"Missing Requires Params", [validation: :required]}
    assert changeset.errors[:image] == {"Missing Requires Params", [validation: :required]}
  end
end
