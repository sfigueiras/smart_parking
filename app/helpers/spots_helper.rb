module SpotsHelper
  def reserve_link(spot)
    if current_user.has_reserved(spot)
      link_to 'Liberar', free_spot_path(spot), method: :delete
    else 
      unless current_user.selected_patent.nil? || current_user.has_reservation_with_patent?(current_user.selected_patent.patent) || spot.state == 'Ocupado'
        link_to 'Reservar', reserve_spot_path(spot), class: 'right-align'
      end
    end
  end
end
