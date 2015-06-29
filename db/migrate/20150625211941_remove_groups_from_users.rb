class RemoveGroupsFromUsers < ActiveRecord::Migration
	def self.up
    remove_column :users, :group_list
    remove_column :users, :groups_last_update
  end
  
  def self.down
    add_column :users, :group_list, :text
    add_column :users, :groups_last_update, :datetime
  end
end
