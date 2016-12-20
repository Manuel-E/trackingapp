class TrucksController < ApplicationController
  authorize_resource 
  before_filter :load_truck, only: [:edit, :show, :update,:destroy]
  
  def create
    @truck=Truck.create(truck_params)
    if @truck.save
      flash[:success] = "Truck Saved"
      redirect_to edit_truck_path(@truck)
    else
      flash[:error] = "The Truck Could not be saved"
      render action: "new"
    end
  end

  def destroy
    if @truck.destroy
      flash[:success] = "Truck deleted"
    else
      flash[:error] = "The Truck Could not be deleted"
    end
    redirect_to trucks_path
  end
  
  def index
    @trucks=Truck.all.order(:created_at)
  end

  def new
    @truck=Truck.new
  end

  def show
  end

  def update
    if @truck.update(truck_params)
      flash[:success] = "Truck updated"
      redirect_to edit_truck_path(@truck)
    else
      flash[:error] = "The Truck Could not be updated"
    end
  end

  private
    def load_truck
      @truck = Truck.find_by_id(params[:id])
    end
    def truck_params
      params.require(:truck).permit(:name,:fleet_id)
    end
end
