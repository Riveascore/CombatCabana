module CurrentCart
	extend ActiveSupport::Concern

	# This is so this is available to all controllers
	# but will never be able to be called as an action
	private

		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
end