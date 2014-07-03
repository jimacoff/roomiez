class Task < ActiveRecord::Base
	belongs_to :apartment
	#belongs_to :assignee, :class_name => 'User'
	#belongs_to :creator, :class_name => 'User' 

end