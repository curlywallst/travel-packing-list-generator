class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :trip_items
  has_many :items, through: :trip_items

  def items_attributes=(item_attributes)
    item_attributes.values.each do |item_attribute|
      item = Item.find_or_create_by(item_attribute)
      self.trip_items.build(item: item)
    end
  end
end
