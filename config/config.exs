import Config

config :pdb_demo,
  ecto_repos: [PdbDemo.Repo],
  generators: [timestamp_type: :utc_datetime]

import_config "#{config_env()}.exs"
