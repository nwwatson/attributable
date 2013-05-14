class AddHstoreToPostgres < ActiveRecord::Migration
  def up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
  end
end
