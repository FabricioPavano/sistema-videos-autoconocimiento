class LandingController < ApplicationController
	def index
		
		require './config/environment.rb' # Assuming the script is located in the root of the rails app
		begin
		  ActiveRecord::Base.establish_connection # Establishes connection
		  ActiveRecord::Base.connection # Calls connection object
		  
		  @string = "Connected to database"

		  puts "CONNECTED!" if ActiveRecord::Base.connected? 
		  puts "NOT CONNECTED!" unless ActiveRecord::Base.connected?
		rescue => e
			puts e
		  puts "NOT CONNECTED!"

		  @string = "NOT Connected to database"
		end

		render plain: "Hola mundo! " << @string
	end
end
