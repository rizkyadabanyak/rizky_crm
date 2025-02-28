class CreatePotentialCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :potential_customers, id: :serial, primary_key: :id_potential_customers do |t|

      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
