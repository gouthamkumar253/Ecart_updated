class UsermailMailer < ApplicationMailer
  default from: 'gouthamr1998@gmail.com'
  layout 'mailer'
  
  def instrument_email(user)
    @user=user
    @url="http://localhost:3000"
    mail( to: user.email, subject: 'Instrument posted successfully')
  end

  def digest_email(user)
  	@user=user
    @url="http://localhost:3000"
    mail( to: user.email, subject: 'Daily mail')
  end

end
