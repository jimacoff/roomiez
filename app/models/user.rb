class User < ActiveRecord::Base
	has_many :apartments
	has_many :tasks, through: :apartments 
	#has_many :tasks, :foreign_key => :user_id
	#do we need to add column of :creator_user_id and :user_id for :tasks

	has_many :memberships, :dependent => :destroy
	has_many :circles, through: :memberships

	has_many :messages

	#Does stuff that has to do with photo upload
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/face.jpeg"
 	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	

	def self.filter(query)
    	query.blank? ? User.all : User.where("name LIKE '%#{query}%' OR email LIKE '%#{query}%'")
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
