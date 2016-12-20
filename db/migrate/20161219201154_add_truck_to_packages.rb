class AddTruckToPackages < ActiveRecord::Migration
  def change
    add_reference :packages, :truck, index: true
  end
end
