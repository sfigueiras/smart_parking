class SpotsController < ApplicationController
  before_action :authenticate_user!

  def reserve
    user_patent = current_user.selected_patent
    current_user.reservations.create(spot_id: params[:id], patent_id: user_patent.patent.id, start_at: Time.now)
    redirect_to areas_path
  end

  def free
    reservations = current_user.reservations
    
    #search a reservation that is active. An user can reserve the same spot multiple times 
    @reservation = reservations.where(spot_id: params[:id],ends_at: nil).first
    
    if !@reservation.nil?
      ends = Time.now
    	hours = TimeDifference.between(@reservation.start_at,ends).in_hours
    	amount = hours * 20
    	@reservation.spot.update(state: 'Libre')
      @reservation.update(ends_at: ends, amount: amount)
    end

    respond_to do |format|
      format.js
    end
  end
end
