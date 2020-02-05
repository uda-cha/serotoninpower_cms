require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do 
    @comment = build_stubbed(:comment)
  end

  describe 'バリデーション' do
    it '全ての値が設定されていること' do
      expect(@comment.valid?).to eq(true)
    end

    it 'post_id が空だとNG' do
      @comment.post_id = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'name が空だとNG' do
      @comment.name = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'public が空だとNG' do
      @comment.public = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'content が空だとNG' do
      @comment.content = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'ipadress が空だとNG' do
      @comment.ipadress = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'admin が空だとNG' do
      @comment.admin = ''
      expect(@comment.valid?).to eq(false)
    end

    it 'post_id が 255文字以上だとNG' do
      @comment.post_id = 'ThisIsTest' * 26
      expect(@comment.valid?).to eq(false)
    end

    it 'content が 1200文字以上だとNG' do
      @comment.content = 'ThisIsTest' * 121
      expect(@comment.valid?).to eq(false)
    end

    it 'ipadress がIPv6でもOK' do
      @comment.ipadress = '2001:0db8:bd05:01d2:288a:1fc0:0001:10ee'
      expect(@comment.valid?).to eq(true)
    end

    it 'ipadress がIPとして解釈できないとNG' do
      @comment.ipadress = '127.0.0.0.1'
      expect(@comment.valid?).to eq(false)
    end

  end
end