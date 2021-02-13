# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  describe '実際にお問い合わせを入力してみる' do
    it '有効なお問い合わせ内容の場合は保存されるか' do
      expect(FactoryBot.build(:contact)).to be_valid
    end
  end

  context '空白のバリデーションチェック' do
    it 'nameカラムが空欄の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      contact = FactoryBot.build(:contact, name: "")
      expect(contact).to be_invalid
      expect(contact.errors[:name]).to include("を入力してください")
    end
    it 'titleカラムが空欄の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      contact = FactoryBot.build(:contact, title: "")
      expect(contact).to be_invalid
      expect(contact.errors[:title]).to include("を入力してください")
    end
    it 'emailカラムが空欄の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      contact = FactoryBot.build(:contact, email: "")
      expect(contact).to be_invalid
      expect(contact.errors[:email]).to include("を入力してください")
    end
    it 'messageカラムが空欄の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      contact = FactoryBot.build(:contact, message: "")
      expect(contact).to be_invalid
      expect(contact.errors[:message]).to include("を入力してください")
    end
  end

  context '文字数のバリデーションチェック' do
    it 'nameカラムが10文字以上の場合にバリデーションチェックにより、エラーメッセージが返ってきているか' do
      contact = Contact.new(name: Faker::Lorem.characters(number: 11))
      expect(contact).to be_invalid
      expect(contact.errors[:name]).to include("は10文字以内で入力してください")
    end
  end
end
