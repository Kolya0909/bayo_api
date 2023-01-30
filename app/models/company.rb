class Company < ApplicationRecord
  acts_as_api

  enum company_type: %i[producer overbuying]

  has_many :products, dependent: :destroy
  belongs_to :main_admin, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  has_attached_file :logo,
                    styles:{
                      small: 'x300'
                    },
                    url: '/uploads/companies/logos/:hash.:extension',
                    path: 'public/uploads/companies/logos/:hash.:extension',
                    hash_secret: 'secret_string_for_companies_logos'

  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def company_name
    title
  end

  def logo_url
    return nil unless logo.file?
    logo.url
  end

  api_accessible :list do |t|
    t.add :id
    t.add :title
    t.add :description
    t.add :logo
    t.add :country
    t.add :company_type
    t.add :main_admin_id
    t.add :time_of_send_order
    t.add :time_of_send_delivery
  end

end
