class TripCategory < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category
  
end
