class BasketProduct < ApplicationRecord
  acts_as_api

  belongs_to :product
  belongs_to :basket

  belongs_to :order_product, optional: true

  api_accessible :for_order do |t|
    t.add :product, template: :show
  end

end
