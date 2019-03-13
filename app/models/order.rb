class Order < ApplicationRecord
  has_many :product_oders
  belongs_to :user
end
