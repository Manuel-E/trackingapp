class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.references :fleet, index: true

      t.timestamps
    end
  end
end
