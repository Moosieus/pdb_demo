defmodule PdbDemo.Repo.Migrations.CreateCalls do
  use Ecto.Migration

  def change do
    create table(:systems, primary_key: false) do
      add :id, :text, primary_key: true
      add :full_name, :text, null: false

      timestamps(type: :utc_datetime)
    end

    execute(
      "CREATE TYPE mode as ENUM('A', 'Ae', 'AE', 'D', 'De', 'DE', 'M', 'Me', 'ME', 'T', 'Te', 'TE')"
    )

    create table(:talk_groups) do
      add :system_id, references(:systems, type: :text), null: false
      add :decimal, :integer, null: false
      add :mode, :mode, null: false
      add :description, :text, null: false
      add :alpha_tag, :text, null: false
      add :category, :text, null: false
      add :tag, :text, null: false
      add :active, :boolean, null: false, default: true

      timestamps(type: :utc_datetime)
    end

    unique_index(:talk_groups, [:system_id, :decimal, :active])

    create table(:calls) do
      add :filename, :text, null: false
      add :system_id, references(:systems, type: :text), null: false
      add :emergency, :boolean, default: false, null: false
      add :call_length, :integer, null: false
      add :error_count, :integer, null: false
      add :freq, :integer, null: false
      add :source_list, {:array, :map}
      add :spike_count, :integer, null: false
      add :start_time, :naive_datetime, null: false
      add :stop_time, :naive_datetime, null: false
      add :talk_group_id, references(:talk_groups)
      add :talkgroup_num, :integer, null: false
      add :transcript, :text
    end

    create index(:calls, :start_time)

    execute("""
    CALL paradedb.create_bm25(
      index_name => 'calls_search_idx',
      table_name => 'calls',
      key_field => 'id',
      text_fields => paradedb.field(
        name => 'transcript',
        tokenizer => paradedb.tokenizer('stem', language => 'English')
      ) || paradedb.field(
        name => 'system_id',
        tokenizer => paradedb.tokenizer('raw')
      ),
      numeric_fields => paradedb.field('call_length') || paradedb.field('freq') || paradedb.field('talkgroup_num') || paradedb.field('talk_group_id'),
      boolean_fields => paradedb.field('emergency'),
      datetime_fields => paradedb.field('start_time') || paradedb.field('stop_time')
    )
    """)
  end
end
