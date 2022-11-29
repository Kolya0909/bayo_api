class MainAdmin < ApplicationRecord

  acts_as_api

  api_accessible :list do |t|
    t.add :id
    t.add :name
    t.add :email
  end
end
