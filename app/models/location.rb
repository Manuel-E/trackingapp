class Location < ActiveRecord::Base
	has_many :current_locations, :class_name =>  "Package",:foreign_key => 'current_location_id'
	has_many :origin_locations,class_name: 'Package',:foreign_key => 'origin_id'
  	has_many :destination_locations,class_name: 'Package',:foreign_key => 'destination_id'

  	validates :latitude, numericality: true,allow_nil: true
  	validates :longitude, numericality: true,allow_nil: true
end
