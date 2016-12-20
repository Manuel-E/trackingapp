class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.string :name
      t.references :city, index: true
      t.timestamps
    end
  end
end
