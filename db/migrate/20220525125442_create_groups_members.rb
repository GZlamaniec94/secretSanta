class CreateGroupsMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_members do |t|
      t.integer :group_id
      t.integer :member_id
      t.timestamps
    end
  end
end
