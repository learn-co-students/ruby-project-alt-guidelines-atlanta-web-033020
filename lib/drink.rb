class Drink < ActiveRecord::Base
    belongs_to :menu
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients

    attr_accessor :name
    def initialize(name:)
        @name = name
    end

end