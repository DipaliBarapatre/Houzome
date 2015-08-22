class Design < ActiveRecord::Base
	extend FriendlyId
	has_many :images, dependent: :destroy

	attachment :master_image
	accepts_attachments_for :images, attachment: :file
	scope :with_bhk, ->(bhk) { where('? = ANY (floor_plan_id)', bhk) }

	validates :name, presence: true, uniqueness: true

	friendly_id :name, use: :slugged

	

    # Checker for slugs and geneartion of slugs for older columns
    # Methodname.all.each(&:save)
	def should_generate_new_friendly_id?
	  new_record? || slug.blank?
	end
end
