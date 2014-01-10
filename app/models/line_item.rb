class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

	def total_price
		# Product and quantity are directly accesible, don't have to use this!!!
		product.price*quantity
	end
end
