# PdbDemo

## Local Test Setup
* Clone the forks of `ecto` and `ecto_sql` to your machine, and update `mix.exs` to point to them.
* Create a `.env` file from `.env.example`
* Start ParadeDB: `docker compose up`/`lazydocker`/etc
* Setup the database: `mix setup`
* Import the data dump: `psql -h 127.0.0.1 -U postgres -d pdb_demo_dev -f ./priv/call_data.sql` (pw: "postgres")
* `iex -S mix`

## Helpful stuff
* Connecting to the database: `psql -h 127.0.0.1 -U postgres pdb_demo_dev`.
* Restart to test changes to `ecto` or `ecto_sql` due to plan caching.
* `.iex.exs` will load helpful aliases on startup.
