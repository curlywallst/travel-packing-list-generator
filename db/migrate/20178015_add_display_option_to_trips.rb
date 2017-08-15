class AddDisplayOptionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :display_option, :string, :default => "category_items"
  end
end
