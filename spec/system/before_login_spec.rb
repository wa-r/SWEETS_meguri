# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '新規登録のリンクが表示される' do
        expect(current_path).to have_link
      end
    end
  end
end