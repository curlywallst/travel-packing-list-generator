class CreateTripCategories < ActiveRecord::Migration
  def change
    create_table :trip_categories do |t|
      t.integer :trip_id, index: true, foreign_key: true
      t.integer :category_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
