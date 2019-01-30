class UsermailMailer < ApplicationMailer
  default from: 'gouthamr1998@gmail.com'
  layout 'mailer'
  
  def instrument_email(user)
    @user=user
    @url="http://localhost:3000"
    mail( to: user.email, subject: 'Instrument posted successfully')
  end

  def order_email(user,cart)
    @user=user
    @cart=cart
    @url="http://localhost:3000"
    mail( to: user.email, subject: 'Order Placed successfully')
  end

  def digest_email(user)
  	@user=user
    @url="http://localhost:3000"
    mail( to: user.email, subject: 'Daily mail')
  end

end
