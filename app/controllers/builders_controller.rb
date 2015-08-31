class BuildersController < ApplicationController
  def index
	@q = Builder.ransack(params[:q])
  	@builders = @q.result(distinct: true).page(params[:page]).per(10)
  	@builder = Builder.new
  end

  def show
  	@builder = Builder.includes(:apartments).friendly.find(params[:id])
  end
end
