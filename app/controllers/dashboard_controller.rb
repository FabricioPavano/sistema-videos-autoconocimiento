# Load the gem
require 'sib-api-v3-sdk'

require 'uri'
require 'net/http'


class DashboardController < ApplicationController
	before_action :authenticate_usuario!
	layout :custom_layout

	def index
		@usuario = current_usuario
		@schedule = current_usuario.schedule
	end

	private

    def custom_layout
      'dashboard'
    end

end
