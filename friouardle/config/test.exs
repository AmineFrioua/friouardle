import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :friouardle, Friouardle.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "friouardle_test",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :friouardle, FriouardleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "01A90nJB9b5i2ZpwAs6IulcoK816LJ6P4kpsMybsqjMr+AWOzJ0nDGIIMckqIsQe",
  server: false

# In test we don't send emails.
config :friouardle, Friouardle.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
