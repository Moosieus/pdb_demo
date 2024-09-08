defmodule PdbDemo.Repo.Migrations.CreateTalkGroupBm25 do
  use Ecto.Migration

  def up do
    execute("""
    CALL paradedb.create_bm25(
      index_name => 'talk_groups_search_idx',
      schema_name => 'public',
      table_name => 'talk_groups',
      key_field => 'id',
      text_fields => paradedb.field(
        name => 'description'
      ) || paradedb.field(
        name => 'alpha_tag'
      ) || paradedb.field(
        name => 'category',
        tokenizer => paradedb.tokenizer('raw')
      ) || paradedb.field(
        name => 'tag',
        tokenizer => paradedb.tokenizer('raw')
      ) || paradedb.field(
        name => 'system_id',
        tokenizer => paradedb.tokenizer('raw')
      ),
      boolean_fields => paradedb.field('active')
    )
    """)
  end

  def down do
    execute("""
    CALL paradedb.drop_bm25(
      index_name => 'talk_groups_search_idx',
      schema_name => 'public'
    )
    """)
  end
end
