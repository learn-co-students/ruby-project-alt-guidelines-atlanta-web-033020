require 'pry'

class Student < ActiveRecord::Base
    has_many :reviews
    has_many :stories, through: :reviews

    



end
