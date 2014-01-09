class CombineItemsInCart < ActiveRecord::Migration
  def up
  	# here we replace multiples of an item for a single item, since old
  	# code didn't check for existing item and didn't have quantity
  	Cart.all.each do |cart|
  		# counting number of each product in a cart

  		# {8=>2, 7=>1}
  		# This works, because after running the migration, all rows, even the old
  		# products we added have quantities (defaulted smartly to 0)!
  		sums = cart.line_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				# We're going to remove that item
  				cart.line_items.where(product_id: product_id).delete_all

  				# NOW! Replace with a single line_item, and give it the quantity
  				item = cart.line_items.build(product_id: product_id)
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end

  # I TAKE IT BACK, THIS ISN'T NECESSARILY ANNOYING, IT'S ACTUALLY REALLY COOL!
  # VERY ANNOYING..... but this migration needs to be reversible... in case
  # we find out the customer hates this new addition, or if the new functionality
  # is straight up breaking the system... yes it's annoying, but it has to be done
	LineItem.where("quantity>1").each do |line_item|
		line_item.quantity.times do 
			LineItem.create cart_id: line_item.cart_id,
			product_id: line_item.product_id, quantity: 1
		end
		line_item.destroy
	end
end
