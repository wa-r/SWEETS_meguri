# frozen_string_literal: true

require 'rails_helper'


describe 'ログイン後のテスト' do
  let(:member){ create(:member) }
    # 省略する前のコード@tweet = FactoryBot.create(:tweet)
  let!(:tweet){ FactoryBot.create(:tweet, member_id: member.id) }

  before do
    visit new_member_session_path
    fill_in 'member[name]', with: member.name
    fill_in 'member[email]', with: member.email
    fill_in 'member[password]', with: member.password
    click_button 'ログイン'
  end

  describe 'ログイン後: ヘッダーのテスト' do
    context "表示内容" do
      it 'マイページのリンクが表示され,遷移先が正しい' do
        expect(page).to have_link "", href: member_path(member)
      end
      it '通知のリンクが表示される' do
        expect(page).to have_link "", href: notifications_path(member)
      end
      it 'つぶやきのリンクが表示される' do
        expect(page).to have_link "", href: tweets_path
      end
      it '店舗情報のリンクが表示される' do
        expect(page).to have_link "", href: shops_path
      end
      it 'ランキングのリンクが表示される' do
        expect(page).to have_link "", href: shops_ranking_path
      end
      it 'ログアウトのリンクが表示される' do
        expect(page).to have_link "", href: destroy_member_session_path
      end
    end
  end

  describe 'つぶやき投稿のテスト' do
    before do
      visit new_tweet_path
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq new_tweet_path
      end
      it 'タイトルフォームが表示される' do
        expect(page).to have_field 'tweet[title]'
      end
      it '画像フォームが表示される' do
        expect(page).to have_field 'tweet[image]'
      end
      it 'つぶやき内容フォームが表示される' do
        expect(page).to have_field 'tweet[content]'
      end
      it '投稿ボタンが表示されている' do
        expect(page).to have_button '投稿'
      end
    end

    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'tweet[title]', with: Faker::Lorem.characters(number: 5)
        attach_file 'tweet[image]', "#{Rails.root}/app/assets/images/test.jpg"
        fill_in 'tweet[content]', with: Faker::Lorem.characters(number: 20)
        click_button '投稿'
        expect(current_path).to eq member_path(member)
      end
    end
  end

  describe 'つぶやき一覧画面のテスト' do
    before do
      visit tweets_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content tweet.title
      end
    end
  end

  describe 'つぶやき詳細画面のテスト' do
    before do
      visit tweet_path(tweet)
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq tweet_path(tweet)
      end
      # it '投稿者(自分)の名前のリンク先が正しい' do
      #   expect(page).to have_link tweet.member.name, href: member_path(tweet.member)
      # end
      it '投稿のtitleが表示されている' do
        expect(page).to have_content tweet.title
      end
      it '投稿のcontentが表示されている' do
        expect(page).to have_content tweet.content
      end
      it '削除リンクが存在している' do
        expect(page).to have_link '削除'
      end
    end

    context '削除のテスト' do
      it 'tweetの削除' do
        expect{ tweet.destroy }.to change{ Tweet.count }.by(-1)
      end
    end
  end

  describe 'ログインした会員の会員詳細画面のテスト' do
    before do
      visit member_path(member)
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq member_path(member)
      end
      it 'nameが表示されている' do
        expect(page).to have_content member.name
      end
      it 'introductionが表示されている' do
        expect(page).to have_content member.introduction
      end
      it '編集リンクが表示されている' do
        expect(page).to have_link '編集', href: edit_member_path(member)
      end
      it 'つぶやくリンクが表示されている' do
        expect(page).to have_link 'つぶやく', href: new_tweet_path
      end
      it 'お気に入りリンクが表示されている' do
        expect(page).to have_link 'お気に入り', href: tweet_likes_path(member)
      end
      it 'ブックマークが表示されている' do
        expect(page).to have_link 'ブックマーク', href: bookmarks_path(member)
      end
      it 'フォローリンクが表示されている' do
        expect(page).to have_link 'フォロー', href: follows_member_path(member)
      end
      it 'フォロワーが表示されている' do
        expect(page).to have_link 'フォロワー', href: followers_member_path(member)
      end
    end
  end

  describe 'ログインした会員の編集画面のテスト' do
    before do
      visit edit_member_path(member)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq edit_member_path(member)
      end
      it '「Profile」と表示される' do
        expect(page).to have_content 'Profile'
      end
      it '名前編集フォームが表示される' do
        expect(page).to have_field 'member[name]', with: member.name
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'member[profile_image]'
      end
      it '自己紹介文編集フォームが表示される' do
        expect(page).to have_field 'member[introduction]', with: member.introduction
      end
      it '編集ボタンが表示される' do
        expect(page).to have_button '変更'
      end
    end
    
    context '編集成功のテスト' do
      before do
        @member_old_name = member.name
        @member_old_image = member.profile_image
        @member_old_introduction = member.introduction
        fill_in 'member[name]', with: Faker::Lorem.characters(number: 5)
        attach_file 'member[profile_image]', "#{Rails.root}/app/assets/images/test.jpg"
        fill_in 'member[introduction]', with: Faker::Lorem.characters(number: 20)
        click_button '変更'
      end
      
      it 'nameが正しく更新される' do
        expect(member.reload.name).not_to eq @member_old_name
      end
      it 'profile_imageが正しく更新される' do
        expect(member.reload.profile_image).not_to eq @member_old_image
      end
      it 'introductionが正しく更新される' do
        expect(member.reload.introduction).not_to eq @member_old_introduction
      end
      it '変種内容を変更したら、リダイレクト先が会員詳細画面である' do
        expect(current_path).to eq member_path(member)
        expect(page).to have_content 'Profile'
      end
    end
  end
  
  # ボタン（要素が２つあるとのエラー）
  # context 'ログアウト機能のテスト' do
  #   it 'ログアウトボタンが存在する' do
  #     click_link 'ログアウト'
  #     expect(current_path).to eq root_path
  #   end
  # end
end