class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :code_order
      t.integer :phone
      t.string :email
      t.string :name
      t.string :status
      t.references :user

      t.timestamps
    end
  end
end
