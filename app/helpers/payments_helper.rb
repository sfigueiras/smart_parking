module PaymentsHelper
  def payments?
    !current_user.payments.empty?
  end
end