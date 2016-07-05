class ReservationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_reservation, except: [:index]

	def index
	end

	def pay
		if !@reservation.payment.nil?
			redirect_to areas_path
		end
	end

	def save_pay
		@reservation.update(reservation_pay_params)
		# if payment_id is 0 user selected payment metho that is not credit card 
		if @reservation.payment_id == 0
			payment = Payment.where(payment_method: 'Descuento de Saldo').first_or_create
			@reservation.update(payment_id: payment.id)
		end	
		redirect_to areas_path
	end

	private

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end

	def reservation_pay_params
		params.require(:reservation).permit(:payment_id)
	end
end