class Package < ActiveRecord::Base

  belongs_to :state
  belongs_to :current_location,class_name: 'Location',:foreign_key => 'current_location_id'
  belongs_to :origin,class_name: 'Location',:foreign_key => 'origin_id'
  belongs_to :destination,class_name: 'Location',:foreign_key => 'destination_id'
  belongs_to :truck
  
  accepts_nested_attributes_for :current_location
  accepts_nested_attributes_for :origin
  accepts_nested_attributes_for :destination
  
  before_create :generate_token


  scope :bodega, -> { joins(:state).where("states.name = 'En Bodega'") }
  scope :state, ->(state) { joins(:state).where('states.name = ?',state) }
  scope :no_state, ->(state) { joins(:state).where('states.name != ?',state) }

  validates :current_location, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :state, presence: true
  validates :truck, presence: true


 def cancelable?
    return self.state.name=="En Bodega"
 end

 def cancel_package
  cancel_state=State.find_by_name("Cancelado")
  if !state.blank? && self.state.name=="En Bodega"
    self.state=cancel_state
    self.save!
  end

 end

  private 
  def generate_token()
  	begin
	  	r=rand(4..7)
	  	tracking_id=SecureRandom.hex(r)
	    self. tracking_id = SecureRandom.hex(5)
  	end while self.class.exists?(:tracking_id => tracking_id)

  end


end
