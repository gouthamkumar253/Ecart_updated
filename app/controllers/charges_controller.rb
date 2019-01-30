# Payment Gateway- Not configured yet
class ChargesController < ApplicationController
	
	Stripe.api_key = 'sk_test_BA6Bp7kyqK9BDSmzoGz4oefD'
	def new
	end

	def create
  		# Amount in cents
  		@money =@cart.total_price
      @amount = (@money* 100).to_i 


  	customer = Stripe::Customer.create(
    	:email => params[:stripeEmail],
    	:source  => params[:stripeToken]
  	)

  	charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description => 'Rails Stripe customer',
      :receipt_email => current_user.email,

    	:currency    => 'usd'
  	)

	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to new_charge_path
	end
	

end
