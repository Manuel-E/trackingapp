class Truck < ActiveRecord::Base
  belongs_to :fleet

  validates :name, presence: true, uniqueness: true
  validates :fleet,presence: true

end
