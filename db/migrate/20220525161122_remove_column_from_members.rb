class RemoveColumnFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :group_id, :integer
  end
end
