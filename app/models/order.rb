class Order < ApplicationRecord

  acts_as_api

  has_many :products

end
