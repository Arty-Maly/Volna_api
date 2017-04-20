defmodule VolnaApi.LandingPageController do
  use VolnaApi.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end
end
