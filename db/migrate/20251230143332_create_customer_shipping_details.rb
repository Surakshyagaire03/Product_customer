create_table :customer_shipping_details do |t|
  t.references :customer_order, null: false, foreign_key: true
  t.string :address
  t.string :city
  t.string :postal_code
  t.string :country

  t.timestamps
end


