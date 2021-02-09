# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '投稿テスト' do
  let(:current_member) { create(:member) }
  # 省略する前のコード@tweet = FactoryBot.create(:tweet)
  let!(:tweet) { create(:tweet) }
  describe '投稿のテスト' do
    describe 'top画面(root_path)のテスト' do
      before do
        visit root_path
      end
      context '表示の確認' do
        it 'トップ画面(root_path)に「素敵なスイーツに巡り合えるように」と表示がされているか' do
          expect(page).to have_content("素敵なスイーツに巡り合えるように")
        end
        it 'root_pathが"/"であるか' do
          expect(current_path).to eq("/")
        end
      end
    end
  end

  describe '投稿画面のテスト' do
    before do
      visit new_tweet_path
    end
    context '表示の確認'do
      it 'new_tweet_pathが"/tweets/new"であるか' do
        expect(current_path).to eq("/tweets/new")
      end
    end
    it '投稿ボタンが表示されているか' do
      expect(page).to have_button '投稿'
    end
    
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'tweet[title]', with: Faker::Lorem.characters(number:20)
        attach_file 'tweet[image]', "#{Rails.root}/app/assets/images/test.jpg"
        fill_in 'tweet[content]', with: Faker::Lorem.characters(number:20)
        # current_member.idの情報が不足
        click_button '投稿'
        expect(page).to have_current_path tweet_path(Tweet.last)
      end
    end
  end
  describe '一覧画面のテスト' do
    before do
      visit tweet_path
    end
    context '一覧の表示とリンクの確認' do
      it '一覧表示画面に投稿されたもの表示されているか' do
        expect(page).to have_content tweet.title
        expect(page).to have_content tweet.image
        expect(page).to have_content tweet.content
      end
    end
  end
end
