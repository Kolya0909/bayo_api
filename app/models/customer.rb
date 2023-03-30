class Customer < ApplicationRecord
  has_secure_password
  acts_as_api

  has_one :customer_token, dependent: :destroy
  has_one :basket, dependent: :destroy

  has_many :ratings, as: :user

  has_attached_file :avatar,
                    styles: {
                      large: 'x1024',
                      small: 'x300'
                    },
                    url: '/uploads/customers/avatars/:hash.:extension',
                    path: 'public/uploads/customers/avatars/:hash.:extension',
                    hash_secret: 'secret_string_for_customers_avatars'

  validates_attachment_content_type :avatar, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def avatar_file_url
    return nil unless avatar.file?

    avatar.url
  end

  api_accessible :list do |t|
    t.add :id
    t.add :name
    t.add :email
    t.add :avatar_file_url, as: :avatar
  end
end
