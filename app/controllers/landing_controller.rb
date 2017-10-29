class LandingController < ApplicationController
	def index
		begin
		  @string = "Connected to database" if ActiveRecord::Base.connected? 
		rescue => e
		  @string = "NOT Connected to database"
		end

		render plain: "Hola mundo! " << @string
	end
end
