defmodule IdenticonWeb.Router do
  use IdenticonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", IdenticonWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
