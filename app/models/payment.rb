class Payment < ActiveRecord::Base
	validates :bank, presence:true, if: :pay_with_card?
	validates :credit_card_number, presence:true, numericality: { only_integer: true}, if: :pay_with_card?
	validates :credit_card_key, presence:true, length: {is: 3}, if: :pay_with_card?

	def pay_with_card?
		payment_method == 'Tarjeta de Credito'
	end

	def to_string
		self.bank + " - " + self.credit_card_number
	end
end
