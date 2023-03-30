class Product < ApplicationRecord
  acts_as_api

  enum product_status: %i[in_stock sold delivery_expected]
  enum product_type: %i[telephon smartphon tablet tv laptop]

  validates :name, presence: true

  belongs_to :company
  belongs_to :brand, optional: true

  has_one :product_info, dependent: :destroy

  has_many :ratings, dependent: :destroy
  has_many :basket_products, dependent: :destroy

  has_and_belongs_to_many :categories, -> { distinct }


  api_accessible :list do |t|
    t.add :id
    t.add :name
    t.add :price
    t.add :rating
    t.add :product_status
    t.add :product_info, template: :show
  end

  api_accessible :show do |t|
    t.add :id
    t.add :name
    t.add :price
    t.add :rating
    t.add :product_type
    t.add :product_status
    t.add :brand
    t.add :created_at
    t.add :updated_at
    t.add :product_info, template: :show
  end

end
