class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products, id: :serial, primary_key: :id_product do |t|
      t.string :name
      t.timestamps
    end
  end
end
