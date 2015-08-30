class Apartment < ActiveRecord::Base
	acts_as_paranoid
	attachment :image
	belongs_to :builder
	has_many :towers, dependent: :destroy
	has_many :flats, -> { distinct }, through: :towers, dependent: :destroy
	
end
