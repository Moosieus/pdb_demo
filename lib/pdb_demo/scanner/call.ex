defmodule PdbDemo.Scanner.Call do
  use Ecto.Schema

  alias PdbDemo.Scanner.System
  alias PdbDemo.Scanner.TalkGroup

  schema "calls" do
    field :filename, :string
    field :emergency, :boolean, default: false
    field :call_length, :integer
    field :error_count, :integer
    field :freq, :integer
    field :source_list, {:array, :map}
    field :spike_count, :integer
    field :start_time, :naive_datetime
    field :stop_time, :naive_datetime
    field :talkgroup_num, :integer
    field :transcript, :string

    belongs_to :system, System, type: :string
    belongs_to :talk_group, TalkGroup
  end

  @type t :: %__MODULE__{
          system_id: String.t(),
          filename: String.t(),
          emergency: boolean(),
          call_length: integer(),
          error_count: integer(),
          freq: integer(),
          source_list: list(map()) | nil,
          spike_count: integer(),
          start_time: NaiveDateTime.t(),
          stop_time: NaiveDateTime.t(),
          talkgroup_num: integer(),
          transcript: String.t()
        }
end
