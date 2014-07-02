class User < ActiveRecord::Base
	has_many :apartments
	has_many :tasks, through :apartments 

	has_many :memberships
	has_many :circles, through :memberships

	has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
