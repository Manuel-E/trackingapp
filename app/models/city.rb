class City < ActiveRecord::Base
	has_one :fleets
	
	validates :name, presence: true
end
