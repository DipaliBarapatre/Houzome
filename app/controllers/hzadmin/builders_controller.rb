module Hzadmin
class BuildersController < BaseController 
# before_filter :authenticated?
layout 'admin'

  def index
    @builders = Builder.all
  end

  def new
    @builder = Builder.new    
  end

  def create
    @builder = Builder.new(permit_params)
    if @builder.save
      redirect_to builders_path, :notice => 'Builder registered'
    else
      render 'new'
    end
  end

  def edit
    @builder = Builder.find(params[:id])
  end

  def update
    @builder = Builder.find(params[:id])
    if @builder.update(permit_params)
      redirect_to builders_path, :notice => 'Builder updated'
    else
      render 'edit'
    end
  end

  def destroy
    binding.pry
    @builder = Builder.find(params[:id])
    if @builder.destroy
      redirect_to builders_path, :notice => "Builder deleted"
    else
      render :text => "Something went wrong while deleting this builder."
    end
  end

  private
    def permit_params
     params.require(:builder).permit(:name, :email, :contact, :description)
    end
end
end