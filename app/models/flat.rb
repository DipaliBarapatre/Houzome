class Flat < ActiveRecord::Base
	attachment :fp
	FLOORPLANS = ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK']
	
	has_and_belongs_to_many :towers
	scope :at, -> (flat){ where('numbers && ARRAY[?]', flat) }
end
