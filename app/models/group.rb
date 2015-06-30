class Group < ActiveRecord::Base
	has_many :user_groups
  has_many :users, through: :user_groups

	def to_s
		name
	end

	def gsub(a, b)
		name.gsub(a, b)
	end
end
