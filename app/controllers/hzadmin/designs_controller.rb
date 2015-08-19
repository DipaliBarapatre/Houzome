module Hzadmin
class DesignsController < BaseController 
# before_filter :authenticated?
layout 'admin'

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
    
  end

  def show
    @design = Design.find(params[:id])
    @apartments = @design.apartments
  end

  def create
    binding.pry
    @design = Design.new(permit_params)
    if @design.save
      redirect_to designs_path, :notice => 'Design registered'
    else
      render 'new'
    end
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    if @design.update(permit_params)
      redirect_to designs_path, :notice => 'Design updated'
    else
      render 'edit'
    end
  end

  def destroy
    @design = Design.find(params[:id])
    if @design.destroy
      redirect_to designs_path, :notice => "Design deleted"
    else
      render :text => "Something went wrong while deleting this Design."
    end
  end

  private
    def permit_params
     params.require(:design).permit(:name, :master_image, floor_plan_id: [], images_files: [])
    end
end
end