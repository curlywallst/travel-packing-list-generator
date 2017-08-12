class Category < ActiveRecord::Base
  has_many :trips
  has_many :trip_items, through: :trips
  has_many :items, through: :trips

  def item_attributes=(item)
    self.item = Item.find_or_create_by(name: item.name)
    self.item.update(item)
  end
end
