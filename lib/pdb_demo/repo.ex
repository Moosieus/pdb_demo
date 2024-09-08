defmodule PdbDemo.Repo do
  use Ecto.Repo,
    otp_app: :pdb_demo,
    adapter: Ecto.Adapters.Postgres
end
