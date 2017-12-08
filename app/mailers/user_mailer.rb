class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @email = order.email
    @order = order
    mail(to: @email, subject: "Jungle-Rails Order: # #{@order.id}")
  end
end