class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot

  before_validation do
    !user.has_reservation?
  end

  after_create do 
    spot.update_attribute(:state, 'Ocupado')
  end

  after_destroy do
    spot.update_attribute(:state, 'Libre')
  end
end
