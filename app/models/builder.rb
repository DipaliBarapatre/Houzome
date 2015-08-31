class Builder < ActiveRecord::Base
	extend FriendlyId
	attachment :image
	has_many :apartments, dependent: :destroy

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :contact
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Email not valid"

	friendly_id :name, use: :slugged
	# Checker for slugs and geneartion of slugs for older columns
    # Methodname.all.each(&:save)
	def should_generate_new_friendly_id?
	  new_record? || slug.blank?
	end
end
