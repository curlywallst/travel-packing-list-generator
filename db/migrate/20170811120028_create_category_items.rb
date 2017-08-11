class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
      t.integer :category_id, index: true, foreign_key: true
      t.integer :item_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
