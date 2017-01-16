defmodule VolnaApi.PageController do
  use VolnaApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
