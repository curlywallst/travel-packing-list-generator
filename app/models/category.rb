class Category < ActiveRecord::Base
  has_many :category_items
  has_many :items, through: :category_items
  has_many :trip_categories
  has_many :trips, through: :trip_categories
end
