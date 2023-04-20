class Order < ApplicationRecord

  acts_as_api

  has_one :order_product

  belongs_to :customer

  api_accessible :list do |t|
    t.add :id
    t.add :status
    t.add :order_product, template: :show
  end

end
