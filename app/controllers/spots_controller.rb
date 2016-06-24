class SpotsController < ApplicationController
  def reserve
    current_user.reservations.create(spot_id: params[:id])

    redirect_to areas_path
  end

  def free
    reservations = current_user.reservations
    reservations.destroy(reservations.where(spot_id: params[:id]))

    redirect_to areas_path
  end
end
