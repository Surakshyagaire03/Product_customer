class RenameOrderIdToCustomerOrderIdInOrderItems < ActiveRecord::Migration[8.1]
  def change
    rename_column :order_items, :order_id, :customer_order_id
  end
end

