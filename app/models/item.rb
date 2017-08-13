class Item < ActiveRecord::Base
  has_many :trip_items
  has_many :trips, through: :trip_items
  validates :name, presence: true

  def trips_attributes=(trip_attributes)
    trip_attributes.value.each do |trip_attribute|
      trip = Trip.find_or_create_by(trip_attribute)
      self.trip << trip
    end
  end

  def quantity(trip_id, item_id)
    item = Item.find(item_id)
    trip = Trip.find(trip_id)
    trip.trip_items.find_by(item_id: item_id).quantity
  end

end
