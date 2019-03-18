class AddActivationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, defautl: false
    add_column :users, :activated_at, :datetime
  end
end
