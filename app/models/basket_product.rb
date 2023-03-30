class BasketProduct < ApplicationRecord
  acts_as_api

  belongs_to :product
  belongs_to :basket

end
