create_table :customer_order_items do |t|
  t.references :customer_order, null: false, foreign_key: true
  t.references :product, null: false, foreign_key: true
  t.integer :quantity
  t.decimal :price

  t.timestamps
end


