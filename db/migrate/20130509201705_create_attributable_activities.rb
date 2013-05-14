class CreateAttributableActivities < ActiveRecord::Migration
  def up
    create_table :attributable_activities do |t|
      t.string :action
      t.string :notes
      t.references :user
      t.references :ownable, polymorphic: true
      t.references :trackable, polymorphic: true
      t.hstore :change_hash

      t.timestamps
    end

    add_index :attributable_activities, :action
    add_index :attributable_activities, :user_id
    add_index :attributable_activities, :ownable_id
    add_index :attributable_activities, :ownable_type
    add_index :attributable_activities, :trackable_id
    add_index :attributable_activities, :trackable_type

    execute "CREATE INDEX change_hash_idx ON attributable_activities USING GIST(change_hash)"
  end

  def down
    drop_table :attributable_activities
  end
end
