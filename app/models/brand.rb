class Brand < ApplicationRecord

  acts_as_api

  validates :name, presence: true

  has_many :products, dependent: :destroy

end
