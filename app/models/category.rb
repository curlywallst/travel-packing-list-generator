class Category < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :trips
end
