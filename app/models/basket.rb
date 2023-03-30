class Basket < ApplicationRecord
  acts_as_api

  belongs_to :customer
  has_many :basket_products

end
