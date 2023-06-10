defmodule Friouardle.Repo do
  use Ecto.Repo,
    otp_app: :friouardle,
    adapter: Ecto.Adapters.Postgres
end
