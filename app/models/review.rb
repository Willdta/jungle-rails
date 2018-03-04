class Review < ActiveRecord::Base

  belongs_to :product

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, length: { in: 1..5 } 
  validates :product_id, presence: true

end
