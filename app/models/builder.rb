class Builder < ActiveRecord::Base
	attachment :image

	has_many :apartments

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :contact
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Email not valid"
end
