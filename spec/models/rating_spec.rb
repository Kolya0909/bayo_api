require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'database columns' do
    %i[rate user_id product_id].each do |field|
      it { is_expected.to have_db_column(field).of_type(:integer) }
    end
  end

  describe  'associations' do
    %i[user product].each do |association|
      it { is_expected.to belong_to(association) }
    end
  end
end
