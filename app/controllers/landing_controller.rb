class LandingController < ApplicationController
	def index
		


		Test.first

		

		render plain: "YOLO"
	end
end
