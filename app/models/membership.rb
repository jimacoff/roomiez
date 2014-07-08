class Membership < ActiveRecord::Base
	belongs_to :circle
	belongs_to :user

	validates :user, uniqueness: { scope: :circle, message: "already in this circle" }
end