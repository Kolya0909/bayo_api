class Product < ApplicationRecord
  acts_as_api

  enum product_status: %i[sold in_stock delivery_expected]
  enum product_type: %i[telephon smartphon tablet tv laptop]

  validates :name, presence: true

  belongs_to :company
  belongs_to :brand

  has_one :product_info, dependent: :destroy
  has_many :ratings, dependent: :destroy

  has_and_belongs_to_many :categories, -> { distinct }
end
