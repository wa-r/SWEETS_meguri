# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweetモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tweet.valid? }

    let(:member){ create(:member) }
    let!(:tweet){ build(:tweet, member_id: member.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        tweet.title = ""
        is_expected.to eq false
      end
      it '15文字以下であること(16文字は不可)' do
        tweet.title = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
      it '15文字以下であること(15文字は可)' do
        tweet.title = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        tweet.content = ""
        is_expected.to eq false
      end
      it '150文字以下であること(151文字は不可)' do
        tweet.content = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
      it '150文字以下であること(150文字は可)' do
        tweet.content = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
    end

    context 'imageカラム' do
      it '空欄でないこと' do
        tweet.image = ""
        is_expected.to eq false
      end
    end
  end

  describe '実際に保存をしてみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:tweet)).to be_valid
    end
  end
  # context '空白のバリデーションチェック' do
  #   it 'titleカラムが空欄の場合にバリデーションにより、エラーメッセージが返ってきているか' do
  #     tweet = Tweet.new(title: "", content: "hello", image: image)
  #     expect(tweet).to be_valid
  #     expect(tweet.errors[:title]).to include("タイトルを入力してください")
  #   end
  # end
end