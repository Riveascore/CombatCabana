class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy # if we destroy this cart,
	# this means all the line_items in the cart get destroyed too!

	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			# cart's line_items, build a relationship for product and cart
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
	def total_price
		line_items.to_a.sum { |line_item| line_item.total_price }
	end	
end
