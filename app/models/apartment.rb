class Apartment < ActiveRecord::Base
	attachment :image
	
	belongs_to :builder
	has_many :towers, dependent: :destroy
	has_many :flats, through: :towers, dependent: :destroy
	
	
end
