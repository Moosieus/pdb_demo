defmodule PdbDemo.Scanner.TalkGroup do
  use Ecto.Schema

  alias PdbDemo.Scanner.System

  @modes Enum.flat_map([:A, :D, :M, :T], fn x -> [x, :"#{x}e", :"#{x}E"] end)

  schema "talk_groups" do
    field :decimal, :integer
    field :mode, Ecto.Enum, values: @modes
    field :description, :string
    field :alpha_tag, :string
    field :category, :string
    field :tag, :string
    field :active, :boolean, default: true

    belongs_to :system, System, type: :string

    timestamps(type: :utc_datetime)
  end
end
