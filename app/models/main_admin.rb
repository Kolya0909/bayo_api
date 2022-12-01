class MainAdmin < ApplicationRecord
  has_secure_password
  acts_as_api

  api_accessible :list do |t|
    t.add :id
    t.add :name
    t.add :email
  end
end
