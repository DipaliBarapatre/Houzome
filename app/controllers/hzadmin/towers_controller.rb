module Hzadmin
class TowersController < BaseController 
# before_filter :authenticated?
layout 'admin'
before_filter :default_vars
  def index

  end

  def new
  	@tower = Tower.new
  end

  def create
  	@tower = Tower.new(permit_params.slice(:name, :apartment_id))
  	if @tower.save
  		flash[:success] = "Tower Created"
  		redirect_to builder_apartment_path(params[:tower][:builder_id], params[:tower][:apartment_id])
  	else
  		render 'new'
  	end
  end

  def show
   @tower = Tower.find(params[:id]) 
  end

  def edit
    @tower = Tower.find(params[:id])
  end

  def update
    @tower = Tower.find(params[:id])
    if @tower.update(permit_params.slice(:name, :apartment_id))
      flash[:success] = "Tower Updated"
      redirect_to builder_apartment_path(params[:tower][:builder_id], params[:tower][:apartment_id])
    else
      render 'edit'
    end
  end




private
	def default_vars
	  @apartment = Apartment.find(params[:apartment_id])
	  @builder = @apartment.builder
	end

	def permit_params
		params.require(:tower).permit(:name, :apartment_id, :builder_id)
	end
end
end