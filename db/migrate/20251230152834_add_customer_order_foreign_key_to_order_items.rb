class AddCustomerOrderForeignKeyToOrderItems < ActiveRecord::Migration[8.1]
  def change
    # Remove old foreign key if exists (optional)
    remove_foreign_key :order_items, :orders if foreign_key_exists?(:order_items, :orders)

    # Add foreign key to customer_orders
    add_foreign_key :order_items, :customer_orders
  end
end
