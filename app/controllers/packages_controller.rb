class PackagesController < ApplicationController
  authorize_resource 
  before_filter :load_package, only: [:edit, :show, :update,:destroy]
  
  def cancel_package
    @package=Package.state("En Bodega").find_by_tracking_id(params[:tracking_id])
    if !@package.blank? && @package.cancel_package
        flash[:success] = "Package Canceled"
    else
        flash[:error] = "Package Could not be Canceled"
    end
      redirect_to root_path

  end

  def create
    @package=Package.create(package_params)
    if @package.save
      flash[:success] = "Package Saved"
      redirect_to edit_package_path(@package)
    else
      flash.now[:error] = "Could not save Package"
      render action: "new"
    end
  end

  def destroy
    if @package.destroy
      flash[:success] = "Package deleted"
    else
      flash[:error] = "The Package Could not be deleted"
    end
    redirect_to packages_path
  end  

  def get_package_by_tracking_id
    @package=Package.no_state("Entregado").find_by_tracking_id(params[:tracking_id])
  end

  def index
    if params[:state_name].blank?
   	 @packages=Package.all.order(:created_at)
     else
     @packages=Package.state(params[:state_name]).order(:created_at)
    end
  end

  def new
  	@package=Package.new
    @package.current_location=Location.new
    @package.origin=Location.new
  	@package.destination=Location.new
  end


  def update
    if @package.update(package_params)
      flash[:success] = "Package updated"
    else
      flash[:error] = "The Package Could not be updated"
    end
      redirect_to edit_package_path(@package)

  end

  private
    def load_package
    	@package = Package.find_by_id(params[:id])
  	end
    def package_params
     	params.require(:package).permit(:content,:state_id,:tracking_id,:weight,:truck_id,current_location_attributes: [ :id, :latitude, :longitude, :address ],origin_attributes: [ :id, :latitude, :longitude, :address ],destination_attributes: [ :id, :latitude, :longitude, :address ] )
    end
end
