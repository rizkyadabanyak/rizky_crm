class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers, id: :serial, primary_key: :id_customer do |t|
      t.integer :potential_customer_id
      t.integer :product_id
      t.string :status
      t.timestamps
    end
  end
end
