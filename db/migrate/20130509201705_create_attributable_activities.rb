class CreateAttributableActivities < ActiveRecord::Migration
  def change
    create_table :attributable_activities do |t|
      t.string :action
      t.string :notes
      t.references :user
      t.references :trackable
      t.hstore :change_hash

      t.timestamps
    end
    add_index :attributable_activities, :user_id
    add_index :attributable_activities, :trackable_id
  end
end
