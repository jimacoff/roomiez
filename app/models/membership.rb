class Membership < ActiveRecord::Base
	belongs_to :circle
	belongs_to :user
end