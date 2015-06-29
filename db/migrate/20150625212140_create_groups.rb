class CreateGroups < ActiveRecord::Migration
  def change
		
		create_table :groups do |t|
			t.string :name

			t.timestamps
		end

		create_table :user_groups do |t|
			t.belongs_to :user, index: true
			t.belongs_to :group, index: true

			t.timestamps
		end

  end
end
