class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	# If a cart is present for the user, show it in next login

	
 	include CurrentCart
 	before_action :set_cart
end