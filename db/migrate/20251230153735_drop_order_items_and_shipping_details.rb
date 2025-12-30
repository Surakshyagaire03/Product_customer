class DropOrderItemsAndShippingDetails < ActiveRecord::Migration[8.1]
  def change
    drop_table :order_items, if_exists: true
    drop_table :shipping_details, if_exists: true
  end
end

