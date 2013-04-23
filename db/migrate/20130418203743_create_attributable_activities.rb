class CreateAttributableActivities < ActiveRecord::Migration
  def change
    create_table :attributable_activities do |t|
      t.references :user, index: true
      t.string :action
      t.references :trackable, polymorphic: true
      t.references :organization, index: true
      t.text :note

      t.timestamps
    end
  end
end
