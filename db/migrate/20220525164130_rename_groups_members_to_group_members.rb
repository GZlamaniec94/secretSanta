class RenameGroupsMembersToGroupMembers < ActiveRecord::Migration[6.1]
  def change
    rename_table :groups_members, :group_members
  end
end
