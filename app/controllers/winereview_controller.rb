class WineReviewController < ApplicationController
  
  def show
  end

  def edit
  end


  def index
	@available_at = Time.now
	@books = Book.all
  end

  def new
  	@wine = Wine.new
  end

  def create
  	@wine = Wine.new(wine_params)
  	@wine.save
  	redirect_to @wine
  end

  def update
  	@wine.update(wine_params)
  	redirect_to @wine
  end

  def destroy
  	@wine.destroy
  	redirect_to wines_url
  end

  private

  def wine_params
  	params.require(:wine).permit(:name, :year, :winery, :country, :varietal)
  end

  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  def set_wine
  	@wine = Wine.find(params[:id])
  end
  

end