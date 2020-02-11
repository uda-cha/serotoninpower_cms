require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe '#index' do
    it "ステータスコード200が返ること" do
      get :index, params: { post_id: 'test' }
      expect(response).to have_http_status(200)
    end
  end

  describe '#new' do
    it "ステータスコード200が返ること" do
      get :new, params: { post_id: 'test' }
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    it "ステータスコード302が返ること & newへリダイレクトされること" do
      post :create, params: { post_id: 'test', comment: { name: "tester", content: "ThisIsTest" } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_comment_path)
    end
  end
end