class OrderProduct < ApplicationRecord

  acts_as_api

  has_many :basket_products

  belongs_to :order

end
