# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Memberモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { member.valid? }

    let!(:other_member) { create(:member) }
    let(:member) { build(:member) }

    context 'nameカラム' do
      it "空欄でないこと" do
        member.name = ""
        is_expected.to eq false
      end
      it '2文字以上であること(1文字は不可)' do
        member.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること(2文字は可)' do
        member.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '10文字以下であること(11文字は不可)' do
        member.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
      it '10文字以下であること(10文字は可)' do
        member.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
    end

    context 'introductionカラム' do
      it '100文字以下であること(101文字は不可)' do
        member.introduction = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
      it '100文字以下であること(100文字は可)' do
        member.introduction = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
    end
  end
    
  describe 'アソシエーションのテスト' do
    context 'tweetモデルとの関係' do
      it '1:Nとなっている' do
         expect(Member.reflect_on_association(:tweets).macro).to eq :has_many
      end
    end
  end
end
    