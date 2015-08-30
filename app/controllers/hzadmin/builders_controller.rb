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

  def show
    @builder = Builder.find(params[:id])
    @apartments = @builder.apartments
    @deleted = @builder.apartments.only_deleted
  end

  def create
    @builder = Builder.new(permit_params)
    if @builder.save
      flash[:success] = 'Builder registered'
      redirect_to builders_path
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
      flash[:success] = 'Builder Updated'
      redirect_to builders_path
    else
      render 'edit'
    end
  end

  def destroy
    @builder = Builder.find(params[:id])
    if @builder.destroy
      flash[:error] = "Builder Deleted"
      redirect_to builders_path
    else
      render :text => "Something went wrong while deleting this builder."
    end
  end

  private
    def permit_params
     params.require(:builder).permit(:name, :email, :contact, :description, :image)
    end
end
end