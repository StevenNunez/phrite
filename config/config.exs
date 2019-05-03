# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phrite,
  ecto_repos: [Phrite.Repo]

# Configures the endpoint
config :phrite, PhriteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VccZrSsNfWrHbVYcsY0LLW+I9l84AS0lUJ7avuIS7HA0Ei4iamiBxRCWCRh+ab5T",
  render_errors: [view: PhriteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phrite.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "/8Irqz26OKggIDWl1loi6Mbes/CGtQeB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
