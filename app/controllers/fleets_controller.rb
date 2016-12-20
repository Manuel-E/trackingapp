class FleetsController < ApplicationController
 authorize_resource 
  before_filter :load_fleet, only: [:edit, :show, :update,:destroy]
  
  def create
    @fleet=Fleet.create(fleet_params)
    if @fleet.save
      flash[:success] = "Fleet Saved"
      redirect_to edit_fleet_path(@fleet)
    else
      flash[:error] = "Could not save Fleet"
      render action: "new"
    end
  end

  def destroy
    if @fleet.destroy
      flash[:success] = "Fleet deleted"
    else
      flash[:error] = "The Fleet Could not be deleted"
    end
    redirect_to fleets_path
  end

  def index
  	@fleets=Fleet.all.order(:created_at)
  end

  def new
  	@fleet=Fleet.new
  end

  def show
    @trucks=@fleet.trucks
  end

  def update
    if @fleet.update(fleet_params)
     	flash[:success] = "Fleet Saved"
     	redirect_to edit_fleet_path(@fleet)

    else
     	flash[:error] = "The Fleet Could not update"
    end
      render :edit
  end

  private
    def load_fleet
    	@fleet = Fleet.find_by_id(params[:id])
  	end
    def fleet_params
     	params.require(:fleet).permit(:id,:name,:city_id)
    end
end
