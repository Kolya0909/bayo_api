class Category < ApplicationRecord

  acts_as_api

  validates :title, presence: true

  has_and_belongs_to_many :products, -> { distinct }

end
