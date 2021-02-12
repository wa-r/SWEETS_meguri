# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shopモデルのテスト', type: :model do
  
  shop_image = FactoryBot.create(:shop_image)
  
  describe 'バリデーションのテスト' do
    it '全ての項目を入力済みでないと登録できない' do
      expext(FactoryBot.build(:shop)).to be_valid
    end
  end
end