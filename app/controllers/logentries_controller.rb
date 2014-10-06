class LogentriesController < ApplicationController
	before_action :set_wine

	def index
		@logentries = @wine.logentries.order('created_at desc')
	end

	private

	def set_wine
		@wine = Wine.find(params[:wine_id])
	end
end
