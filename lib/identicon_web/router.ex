defmodule IdenticonWeb.Router do
  use IdenticonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IdenticonWeb do
    pipe_through :api
    get "/", ImageController, :image
    get "/default", DefaultController, :index
  end
end
