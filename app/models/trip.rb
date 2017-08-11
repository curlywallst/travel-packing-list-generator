class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_categories
  has_many :categories, through: :trip_categories

end
