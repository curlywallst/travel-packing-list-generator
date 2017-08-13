class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :trip_items
  has_many :items, through: :trip_items
  validates :title, presence: true
  validates :destination, presence: true
  validates :year, presence: true, format: { with: /(19|20)\d{2}/i, message: "should be a four-digit year" }
  validates :category, presence: true

  def items_attributes=(item_attributes)
    item_attributes.value.each do |item_attribute|
      item = Item.find_or_create_by(item_attribute)
      self.items << item
    end
  end


  def add_item
    trip_item = self.trip_items.build
  end
end
