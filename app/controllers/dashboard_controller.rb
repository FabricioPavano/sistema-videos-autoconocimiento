class DashboardController < ApplicationController
	before_action :authenticate_usuario!
	layout :custom_layout


	def index
	end

	private
    def custom_layout
      'dashboard'
    end

end
