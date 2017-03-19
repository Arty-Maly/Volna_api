defmodule VolnaApi.Router do
  use VolnaApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: VolnaApi.Token
    plug Guardian.Plug.LoadResource
  end

  scope "/", VolnaApi do
    pipe_through :browser # Use the default browser stack
    resources "/sessions", SessionController, only: [:new, :create,
                                                   :delete]
    resources "/users", UserController, only: [:new, :create]
    get "/", PageController, :index
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
  end

  scope "/", VolnaApi do
    pipe_through [:browser, :browser_auth]
    resources "/users", UserController, only: [:show, :index, :update]
    get "/radiostations", RadioStationController, :show
    resources "/radiostations", RadioStationController, only: [:update]
  end


  scope "/api", VolnaApi do
    pipe_through :api

    resources "/radiostations", RadioStationController, only: [:index]
  end
end
