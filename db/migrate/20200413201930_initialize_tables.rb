class InitializeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
    end
    create_table :menus do |t|
      t.integer :shop_id
    end
    create_table :drinks do |t|
      t.string :name
      t.float :price
      t.integer :menu_id
    end
    create_table :ingredients do |t|
      t.string :name
    end
    create_table :drink_ingredients do |t|
      t.integer :ingredient_id
      t.integer :drink_id
    end
  end
end
