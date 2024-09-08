import Config

# Configure your database
config :pdb_demo, PdbDemo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pdb_demo_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
