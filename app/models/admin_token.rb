class AdminToken < ApplicationRecord
  belongs_to :main_admin, dependent: :destroy
end
