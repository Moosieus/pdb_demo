defmodule PdbDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :pdb_demo,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {PdbDemo.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, git: "https://github.com/moosieus/ecto", ref: "cf5d838f7fe1cb5da2044ccd3d9bf5af67eaac21", override: true},
      {:ecto_sql, git: "https://github.com/moosieus/ecto_sql", ref: "fbf3f19e1a26bcb1ce55c5f60adbce6bc9bc69a5", override: true},
      {:postgrex, ">= 0.0.0"},
      {:ecto_map_set, path: "/home/moosieus/Projects/ecto_map_set"},
      {:jason, "~> 1.2"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
