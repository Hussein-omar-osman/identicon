# Identicon

The project is an Identicon generator that utilizes the Phoenix Framework to create unique avatar images for users. The generated images are based on the user's name, which is passed as a parameter to the endpoint. The Identicon generator uses a combination of geometric shapes and colors to create a unique image for each user.
Live demo: https://identicon.fly.dev/

## Prerequisites

The prerequisites to run this project will depend on the mode you choose:

#### 1. From build

Before you can run this project, you will need to have the following:

1. `postgres` - our database you may find instructions on how to set it up [here](https://www.postgresql.org/)
2. `asdf` - the flexible runtime version manager, find it [here](https://asdf-vm.com/). This will ensure that everyone runs the same version of erlang and elixir.
3. `git` - package manager

To start the Rando server:

- Asdf requires you add a couple of plugins, which can easily be added using
  - `asdf plugin add erlang`
  - `asdf plugin add elixir`
- clone the repo
  - `git clone git@github.com:kirega/rando.git`
- Change in the directory
  - `cd rando`
- Run asdf to setup the environment
  - `asdf install`
- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
- For testing, run `MIX_ENV=test mix test`

After testing the service, you can always reset the database to start all over again with `mix ecto.reset`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

