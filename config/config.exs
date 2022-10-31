import Config

defmodule TodoApp.Kaffy.Config do
  def create_resources(_conn) do
    [
      tasks: [
        name: "Todos",
        resources: [
          todo: [schema: TodoApp.Todo],
        ]
      ]
    ]
  end
end

config :kaffy,
  otp_app: :todo_app,
  ecto_repo: TodoApp.Repo,
  router: TodoWeb.Router,
  admin_logo: "/images/icon.svg",
  admin_logo_mini: "/images/icon.svg",
  hide_dashboard: true,
  home_page: [schema: ["tasks", "todo"]],
  resources: &TodoApp.Kaffy.Config.create_resources/1,
  extensions: [
    TodoWeb.Kaffy.Extension
  ]

config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :dart_sass,
  version: "1.49.11",
  default: [
    args: ~w(css/app.scss ../priv/static/assets/app.css),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger,
  handle_otp_reports: true,
  handle_sasl_reports: true,
  backends: [:console]

config :logger, :console,
  level: :notice,
  format: "$time $metadata[$level] $levelpad$message\n",
  metadata: [:request_id]

# Configures the endpoint
config :todo_app, TodoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 0],
  render_errors: [view: TodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TodoApp.PubSub,
  live_view: [signing_salt: "sWpG9ljX"],
  secret_key_base: :crypto.strong_rand_bytes(32),
  server: true

config :phoenix, :json_library, Jason

config :todo_app,
  ecto_repos: [TodoApp.Repo]

# We're defining this at runtime
# config :todo_app, TodoApp.Repo, database: "~/.config/todo/database.sq3"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
