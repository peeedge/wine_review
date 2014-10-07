class LogentriesController < ApplicationController
	before_action :set_wine

	def index
		@logentries = @wine.logentries.order('created_at desc')
	end

	def new
	  @logentry = @wine.logentries.new
	end

	def create
	  @logentry = @wine.logentries.new(logentry_params)
	  if @logentry.save
	    redirect_to wine_logentries_path(@wine), notice: 'Log Entry saved!'
	  else
	    render :new
	  end
	end

private

	def logentry_params
	  params.require(:logentry).permit(:rating, :name, :comments, :location, :tasted_on)
	end

	def set_wine
		@wine = Wine.find(params[:wine_id])
	end
end
