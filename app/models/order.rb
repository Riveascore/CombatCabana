class Order < ActiveRecord::Base
	PAYMENT_TYPES = ["Purchase Order", "Check", "Credit Card"]
	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES
	has_many :line_items, dependent: :destroy

	def add_line_items_from_cart(cart)
		cart.line_items.each do |line_item|
			# We have to remove these line_items from the cart
			line_item.cart_id = nil
			line_items << line_item
		end

	end
end
