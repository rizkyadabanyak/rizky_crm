class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :serial, primary_key: :id do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :level
      t.timestamps
    end
  end
end
