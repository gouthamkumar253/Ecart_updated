module CurrentCart

private

	def set_cart
		#if current_user
			@cart=Cart.find(session[:cart_id])
			rescue ActiveRecord::RecordNotFound
				@cart=Cart.create
				session[:cart_id]=@cart.id
			#end
		end
	end
