defmodule ExampleServer.Repo do
  use Ecto.Repo,
    otp_app: :example_server,
    adapter: Ecto.Adapters.Postgres
end
