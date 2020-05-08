require 'pry'

class Review < ActiveRecord::Base
    belongs_to :student
    belongs_to :story




    
end
