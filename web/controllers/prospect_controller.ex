defmodule VolnaApi.ProspectController do
  use VolnaApi.Web, :controller
  alias VolnaApi.Prospect

  def index(conn, params) do
    prospects = Repo.all(Prospect)

    render(conn, "index.html", prospects: prospects)
  end

  def create(conn, %{"prospect" => %{"email" => ""}}) do
    conn
    |> redirect(to: landing_page_path(conn, :index))
  end

  def create(conn, %{"prospect" => prospect_params}) do
    changeset = Prospect.changeset(%Prospect{}, prospect_params)
    case Repo.insert(changeset) do
      {:ok, prospect} ->
        conn
        |> put_flash(:info, "Вы подписались!")
        |> redirect(to: landing_page_path(conn, :index))
      {:error, changeset} ->
        conn
        |> redirect(to: landing_page_path(conn, :index))
    end
  end

  def create(conn, _) do
    conn
    |> redirect(to: landing_page_path(conn, :index))
  end
end