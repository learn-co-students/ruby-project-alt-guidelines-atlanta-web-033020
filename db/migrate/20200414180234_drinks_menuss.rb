class DrinksMenuss < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks_menus do |dm|
      dm.integer :drink_id
      dm.integer :menu_id
    end
  end
end
