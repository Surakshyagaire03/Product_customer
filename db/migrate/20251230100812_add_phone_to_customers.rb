class AddPhoneToCustomers < ActiveRecord::Migration[8.1]
  def change
    add_column :customers, :phone, :string
  end
end
