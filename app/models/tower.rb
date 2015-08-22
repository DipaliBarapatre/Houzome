class Tower < ActiveRecord::Base
  belongs_to :apartment
  has_and_belongs_to_many :flats

  
end
