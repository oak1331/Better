require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '登録ができる時' do
      it '全ての項目の入力がが存在すれば登録できること' do
        expect(@post).to be_valid
      end
    end

    context '登録ができない時' do
      it 'titleが空では登録できないこと' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'textが空では登録できないこと' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('テキストを入力してください')
      end

      it 'imageが空では登録できないこと' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('画像を入力してください')
      end

      it 'time_slot_idが1では登録できないこと' do
        @post.time_slot_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('時間帯は1以外の値にしてください')
      end

      it 'category_idが1では登録できないこと' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end

      it 'situation_idが1では登録できないこと' do
        @post.situation_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('シチュエーションは1以外の値にしてください')
      end

      it 'prefecture_idが1では登録できないこと' do
        @post.prefecture_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('場所は1以外の値にしてください')
      end

      it 'weather_idが1では登録できないこと' do
        @post.weather_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('天気は1以外の値にしてください')
      end

      it 'ユーザーが紐付いていなければ投稿できないこと' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
