class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :content
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
