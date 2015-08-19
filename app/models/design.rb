class Design < ActiveRecord::Base
	has_many :images, dependent: :destroy

	attachment :master_image
	accepts_attachments_for :images, attachment: :file
	scope :with_bhk, ->(bhk) { where('? = ANY (floor_plan_id)', bhk) }
end
