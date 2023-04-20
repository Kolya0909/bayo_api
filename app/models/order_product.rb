class OrderProduct < ApplicationRecord

  acts_as_api

  has_many :basket_products

  belongs_to :order

  api_accessible :show do |t|
    t.add :basket_products, template: :for_order
  end

end
