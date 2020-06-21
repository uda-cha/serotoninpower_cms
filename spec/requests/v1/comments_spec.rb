require 'rails_helper'

describe '#index' do
  before do
    @comment = create(:comment)
  end

  it 'コメントがない場合' do
    get '/v1/posts/naiyo/comments'
    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['data']).to eq([])
  end

  it 'コメントがある場合' do
    get '/v1/posts/test/comments'
    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['data'].length).to eq(1)
    expect(json['data'].first['content']).to eq('ThisIsTest')
    expect(json['data'].first['public']).to eq(nil)
    expect(json['data'].first['ipadress']).to eq(nil)
    expect(json['data'].first['admin']).to eq(nil)
  end
end

describe '#create' do
  before do
    @comment = build_stubbed(:comment)
  end

  it 'コメントが正常に作成されること' do
    post "/v1/posts/#{@comment.post_id}/comments", params: {comment: { name: @comment.name, content: @comment.content }}
    json = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(json['data']).to eq("created.")
  end

  it 'JSONのスキーマがおかしい場合、400が返ること' do
    post "/v1/posts/#{@comment.post_id}/comments", params: "{comment: { name: #{@comment.name}, content: #{@comment.content} }}}}"
    json = JSON.parse(response.body)

    expect(response.status).to eq(400)
  end

  it 'パラメータが足りない場合、406が返ること' do
    post "/v1/posts/#{@comment.post_id}/comments", params: {comment: { name: @comment.name}}
    json = JSON.parse(response.body)

    expect(response.status).to eq(406)
  end

  it 'パラメータがない場合、400が返ること' do
    post "/v1/posts/#{@comment.post_id}/comments"
    json = JSON.parse(response.body)

    expect(response.status).to eq(400)
  end
end