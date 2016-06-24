class Area < ActiveRecord::Base
  has_many :spots

  def self.free_spots
    Spot.where(state: 'Libre')
  end
end
