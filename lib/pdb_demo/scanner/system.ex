defmodule PdbDemo.Scanner.System do
  use Ecto.Schema

  alias PdbDemo.Scanner.TalkGroup

  @primary_key {:id, :string, autogenerate: false}

  schema "systems" do
    field :full_name, :string

    has_many :talk_groups, TalkGroup

    timestamps(type: :utc_datetime)
  end
end
