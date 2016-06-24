module SpotsHelper
  def reserve_link(spot)
    if current_user.has_reserved(spot)
      link_to 'Liberar', free_spot_path(spot), method: :delete
    else 
      unless current_user.has_reservation? || spot.state == 'Ocupado'
        link_to 'Reservar', reserve_spot_path(spot), class: 'right-align'
      end
    end
  end
end
