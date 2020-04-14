class DrinksMenu < ActiveRecord::Base
    belongs_to :drink
    belongs_to :menu
    validates :drink_id, :uniqueness => { :scope => :menu_id }
end