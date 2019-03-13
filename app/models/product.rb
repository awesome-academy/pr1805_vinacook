class Product < ApplicationRecord
  has_many :product_orders
  has_many :rates
  has_many :comments
  belongs_to :product_category
end
