class CreateShippingDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :shipping_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
