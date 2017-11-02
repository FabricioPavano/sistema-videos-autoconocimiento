class LandingController < ApplicationController
	def index
		if usuario_signed_in?
		  redirect_to dashboard_path
		end
	end

	def ingresar
	end
end
