class Truck < ActiveRecord::Base
  belongs_to :fleet
  has_many :packages

  validates :name, presence: true
  validates :fleet,presence: true

end
