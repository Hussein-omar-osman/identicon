defmodule Identicon.Repo do
  use Ecto.Repo,
    otp_app: :identicon,
    adapter: Ecto.Adapters.Postgres
end
