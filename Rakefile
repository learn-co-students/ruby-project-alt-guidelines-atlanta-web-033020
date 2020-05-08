require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  # START reference the file config/environment START
  # Explanation: Vid.Lect 00:43:00 MOD 1: Intro to Active Record Associations

  #To turn logger notes off:
  ## old_logger = ActiveRecord::Base.logger
  ## ActiveRecord::Base.logger = nil
  
  #To turn logger notes back on: 
  ##ActiveRecord::Base.logger = old_logger


  # END reference the file config/environment END





  Pry.start
end
