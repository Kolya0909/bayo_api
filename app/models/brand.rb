class Brand < ApplicationRecord
  acts_as_api

  validates :name, presence: true

  has_many :products, dependent: :destroy

  api_accessible :list do |t|
    t.add :id
    t.add :name
  end

end
