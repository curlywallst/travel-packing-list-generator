class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.integer :year
      t.string :notes
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
