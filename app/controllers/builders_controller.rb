class BuildersController < ApplicationController
  def index
	@builders = Builder.all  	
  end

  def show
  	@builder = Builder.includes(:apartments).find(params[:id])
  end
end
