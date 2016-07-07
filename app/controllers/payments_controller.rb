class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@payment = Payment.new
	end

	def create
		@payment = current_user.payments.new(payment_params)
		@payment.payment_method = 'Tarjeta de Credito'
		if @payment.save
			redirect_to payments_path
		else
			render :new
		end
	end

	def destroy
		current_user.payments.destroy(params[:id])

		redirect_to payments_path
	end

	private

	def payment_params
		params.require(:payment).permit(:bank,:credit_card_number,:credit_card_key)
	end
end