class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :tracking_id
      t.float :weight
      t.string :content
      t.references :state, index: true
      t.references :origin,references: :location, index: true
      t.references :destination,references: :location, index: true
      t.references :current_location,references: :location, index: true

      t.timestamps
    end
  end
end
