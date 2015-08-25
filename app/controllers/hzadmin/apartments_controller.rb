## Admin Dashboard >> Builders

module Hzadmin
class ApartmentsController < BaseController 
# before_filter :authenticated?
layout 'admin'
  def new
    @builder = Builder.find(params[:builder_id])
    @apartment = @builder.apartments.build
  end

  def show
    @apartment = Apartment.includes(:builder, :towers, :flats).find(params[:id])
  end
  
  def create
    @apartment = Apartment.new(permit_params)
    if @apartment.save
      flash[:success] = "Apartment created"
      redirect_to builder_path(@apartment.builder_id)
    else
      flash[:warning] = "Something not right. Please check once again"
      render 'new'
    end
  end


  def edit
    @builder = Builder.find(params[:builder_id])
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])
    if @apartment.update(permit_params)
      flash[:success] = "Apartment Updated"
      redirect_to builder_path(@apartment.builder_id)
    else
      flash[:warning] = "Something not right. Please check once again"
      render 'edit'
    end
  end

  private
    def permit_params
      params.require(:apartment).permit(:builder_id, :name, :image, :latitude, :longitude, :city, :area, :address)
    end
end
end