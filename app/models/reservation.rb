class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot
  belongs_to :patent
  belongs_to :payment

  validate :spot_state_must_be_free, :user_cant_have_a_reservation_with_selected_patent, on: :create

  def spot_state_must_be_free
    if spot.state == 'Ocupado'
      errors.add(:spot, "la plaza debe estar libre")
    end
  end

  def user_cant_have_a_reservation_with_selected_patent
    if user.selected_patent.nil? || user.has_reservation_with_patent?(user.selected_patent.patent)
      errors.add(:user, 'El usuario no puede tener una reserva vigente con la patente seleccionada')
    end
  end

  after_create do 
    spot.update(state:'Ocupado')
  end

end
