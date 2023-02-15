class ProductInfo < ApplicationRecord
  acts_as_api

  validates :title, presence: true

  belongs_to :product
end
