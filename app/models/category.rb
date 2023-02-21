class Category < ApplicationRecord
  acts_as_api

  validates :title, presence: true

  has_and_belongs_to_many :products, -> { distinct }

  api_accessible :list do |t|
    t.add :id
    t.add :title
    t.add :created_at
    t.add :updated_at
  end

  api_accessible :show do |t|
    t.add :id
    t.add :title
  end
end
