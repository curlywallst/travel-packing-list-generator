class CreateTripItems < ActiveRecord::Migration
  def change
    create_table :trip_items do |t|
      t.integer :trip_id, index: true, foreign_key: true
      t.integer :item_id, index: true, foreign_key: true
      t.integer :quantity, :default => 1

      t.timestamps null: false
    end
  end
end
