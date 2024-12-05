defmodule Noosphere.Repo do
  use Ecto.Repo,
    otp_app: :noosphere,
    adapter: Ecto.Adapters.Postgres
end
