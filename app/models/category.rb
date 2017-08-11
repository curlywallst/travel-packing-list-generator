class Category < ActiveRecord::Base
  has_many :category_items
  has_many :items, through: :category_items
  has_many :trips

  def item_attributes=(item)
    self.item = Item.find_or_create_by(name: item.name)
    self.item.update(item)
  end
end
