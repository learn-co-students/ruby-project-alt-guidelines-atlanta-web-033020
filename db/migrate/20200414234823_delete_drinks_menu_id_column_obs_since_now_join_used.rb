class DeleteDrinksMenuIdColumnObsSinceNowJoinUsed < ActiveRecord::Migration[5.2]
  def change
    remove_column :drinks, :menu_id
  end
end
