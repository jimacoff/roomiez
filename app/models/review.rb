class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :apartment

  validates :user_id, :apartment_id, :body, presence: true
  validates :rating, presence: true, inclusion: [1,2,3,4,5]

end
