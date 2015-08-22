class Order < ActiveRecord::Base
  belongs_to :apartment
  include AASM
  include NumberGenerator # Used as global to generate random number with perfix overwrite with 
  extend FriendlyId
  friendly_id :number

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	aasm do
	  state :under_progress, :initial => true
  	  state :client_follow_up
  	  state :customizations_requested
  	  state :customization_quote 
  	  state :interior_finalized
  	  state :payments_done
  	  state :order_completed
  	  state :client_not_interested
	end
  
	def generate_number(options = {})
	  options[:prefix] ||= 'O'
	  super(options)
	end
end
