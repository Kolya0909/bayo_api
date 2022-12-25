class Customer < ApplicationRecord
  has_secure_password
  acts_as_api

  has_one :customer_token
end
