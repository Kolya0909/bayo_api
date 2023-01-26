require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'database columns' do
    %i[name rating].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end
    %i[price company_id brand_id].each do |field|
      it { is_expected.to have_db_column(field).of_type(:integer) }
    end
  end

  describe 'associations' do
    %i[company brand].each do |association|
      it { is_expected.to belong_to(association) }
    end
    %i[product_info].each do |association|
      it { is_expected.to have_one(association) }
    end
    %i[ratings].each do |association|
      it { is_expected.to have_many(association) }
    end
    %i[categories].each do |association|
      it { is_expected.to have_and_belong_to_many(association) }
    end
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:product_status).with_values(described_class.product_statuses) }
    it { is_expected.to define_enum_for(:product_type).with_values(described_class.product_types) }
  end
end