defmodule Des.Repo do
  use Ecto.Repo,
    otp_app: :des,
    adapter: Ecto.Adapters.Postgres
end
