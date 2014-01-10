class AddPriceToLineItem < ActiveRecord::Migration
  def self.up
  	say_with_time "Updating prices..." do
		add_column :line_items, :price, :decimal, precision: 8, scale: 2
		LineItem.all.each do |line_item|
			line_item.update_attribute :price, line_item.product.price
			# puts line_item.product
		end
	end
  end

  def self.down
  	remove_column :line_items, :price
  end
end
