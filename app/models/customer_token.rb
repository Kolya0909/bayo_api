class CustomerToken < ApplicationRecord
  belongs_to :customer, dependent: :destroy
end
