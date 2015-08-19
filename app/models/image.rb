class Image < ActiveRecord::Base
  belongs_to :design
  attachment :file
end
