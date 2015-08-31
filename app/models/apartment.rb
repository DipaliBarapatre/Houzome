class Apartment < ActiveRecord::Base
	extend FriendlyId
	acts_as_paranoid
	attachment :image
	belongs_to :builder
	has_many :towers, dependent: :destroy
	has_many :flats, -> { distinct }, through: :towers, dependent: :destroy
	
	friendly_id :name, use: :slugged

	# Checker for slugs and geneartion of slugs for older columns
    # Methodname.all.each(&:save)
	def should_generate_new_friendly_id?
	  new_record? || slug.blank?
	end
end
