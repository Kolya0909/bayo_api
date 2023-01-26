require 'rails_helper'

RSpec.describe MainAdmin, type: :model do
  describe 'database columns' do
    %i[name email password_digest].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end
  end

  describe 'associations' do
    %i[companies].each do |association|
      it { is_expected.to have_many(association) }
    end
    %i[admin_token].each do |association|
      it { is_expected.to have_one(association) }
    end
  end
end

