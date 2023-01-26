require 'rails_helper'

RSpec.describe ProductInfo, type: :model do
  describe 'database columns' do
    %i[title screen processor ram memory camera].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end

    %i[description].each do |field|
      it { is_expected.to have_db_column(field).of_type(:text) }
    end

    %i[product_id].each do |field|
      it { is_expected.to have_db_column(field).of_type(:integer) }
    end
  end

  describe 'associations' do
    %i[product].each do |association|
      it { is_expected.to belong_to(association) }
    end
  end
end
