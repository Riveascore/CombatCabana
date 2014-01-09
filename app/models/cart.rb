class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy # if we destroy this cart,
	# this means all the line_items in the cart get destroyed too!
end
