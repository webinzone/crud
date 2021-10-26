class Product < ApplicationRecord
  validates :name, presence: true, length: {maximum: 32}, allow_blank: true
  validates :cost, length: {maximum: 32}, allow_blank: true
  validates :description, length: {maximum: 32}, allow_blank: true

	has_one_attached :image
	
  
end
