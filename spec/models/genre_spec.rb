# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do
  describe '実際に投稿して保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:genre)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'nameカラムが空欄の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      genre = FactoryBot.build(:genre, name: "")
      expect(genre).to be_invalid
      expect(genre.errors[:name]).to include("を入力してください")
    end
    it 'nameカラムが10文字以上の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      genre = Genre.new(name: Faker::Lorem.characters(number: 11))
      expect(genre).to be_invalid
      expect(genre.errors[:name]).to include("は10文字以内で入力してください")
    end
  end
end