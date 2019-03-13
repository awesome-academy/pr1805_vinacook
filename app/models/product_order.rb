class ProductOrder < ApplicationRecord
  belongs_to :oder
  belongs_to :product
end
