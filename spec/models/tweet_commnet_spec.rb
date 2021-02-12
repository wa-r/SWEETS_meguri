# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweet_commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    
    let(member){ FactoryBot.create(:member) }
    let!(tweet){ FactoryBot.create(:tweet, member_id: member.id) }
    let!(tweet_comment){FactoryBot.create(:tweet_comment, member_id: member.id, tweet_id: tweet.id) }
    
    context 'commentカラム' do
      it '空欄でないこと' do
        tweet_comment.comment = ""
        is_expected.to eq false
      end
    end
  end
end