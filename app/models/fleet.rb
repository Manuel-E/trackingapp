class Fleet < ActiveRecord::Base
	belongs_to :city
	has_many :trucks
	validates :name, presence: true
	validates :city, presence: true, uniqueness: true

end
