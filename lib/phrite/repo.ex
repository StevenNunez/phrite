defmodule Phrite.Repo do
  use Ecto.Repo,
    otp_app: :phrite,
    adapter: Ecto.Adapters.Postgres
end
