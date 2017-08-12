class Item < ActiveRecord::Base
  has_many :trip_items
  has_many :trips, through: :trip_items

  def trips_attributes=(trip_attributes)
    trip_attributes.values.each do |trip_attribute|
      trip = Trip.find_or_create_by(trip_attribute)
      self.trip_items.build(trip: trip)
    end
  end
end
