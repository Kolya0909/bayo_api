class Rating < ApplicationRecord

  acts_as_api

  validates :rate, presence: true
  belongs_to :user, polymorphic: true

end
