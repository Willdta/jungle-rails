class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user, order)
    @user = user
    @order = order
    mail(to: @order.email, subject: @order.id)
  end

end
