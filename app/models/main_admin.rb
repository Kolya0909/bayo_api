class MainAdmin < ApplicationRecord
  has_secure_password
  acts_as_api

  has_one :admin_token

  has_attached_file :avatar,
                 styles: {
                   large: 'x1024',
                   small: 'x300'
                 },
                 url: '/uploads/main_admins/avatars/:hash.:extension',
                 path: 'public/uploads/main_admins/avatars/:hash.:extension',
                 hash_secret: 'secret_string_for_main_admins_avatars'


  def avatar_file_url
    return nil if avatar.file?
    avatar.url
  end



  api_accessible :list do |t|
    t.add :id
    t.add :name
    t.add :email
    t.add :avatar_file_url, as: :avatar
  end
end
