class Apartment < ActiveRecord::Base
	attachment :image
	
	belongs_to :builder
	has_many :towers, dependent: :destroy
	has_many :flats, -> { distinct }, through: :towers, dependent: :destroy
end
