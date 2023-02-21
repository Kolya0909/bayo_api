class ProductInfo < ApplicationRecord
  acts_as_api

  validates :title, presence: true

  belongs_to :product

  api_accessible :show do |t|
    t.add :id
    t.add :title
    t.add :description
    t.add :screen
    t.add :processor
    t.add :ram
    t.add :memory
    t.add :camera
  end
end
