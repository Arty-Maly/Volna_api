defmodule VolnaApi.ProspectControllerTest do
  use VolnaApi.ConnCase
  import VolnaApi.Factory

  @valid_attrs %{"prospect" => %{"email" => "a@a.com"} }
  @invalid_attrs %{"prospect" => %{"email" => "aaaaa"} }
  @empty_attrs %{"prospect" => %{"email" => ""} }

  test "creates a new prospect with valid params" do
    conn = build_conn()
    conn = post conn, prospect_path(conn, :create), @valid_attrs

    assert VolnaApi.Repo.get_by(VolnaApi.Prospect, email: @valid_attrs["prospect"]["email"])
  end

  test "does not create a new prospect with invalid params" do
    conn = build_conn()
    post conn, prospect_path(conn, :create), @invalid_attrs

    refute VolnaApi.Repo.get_by(VolnaApi.Prospect, email: @invalid_attrs["prospect"]["email"])
  end
end
