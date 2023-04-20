class Order < ApplicationRecord

  acts_as_api

  has_one :order_product

  belongs_to :customer

end
