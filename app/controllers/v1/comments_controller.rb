class V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :comment_params, only: [:create]

  def index
    comments = Comment.where(post_id: params[:post_id], public: true).select(:id, :name, :content, :updated_at)
    render json: {data: comments}, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.public = true
    @comment.ipadress = request.remote_ip
    @comment.admin = false

    if @comment.save
      render json: {data: "created."}, status: :created
    else
      render json: {data: @comment.errors.full_messages}, status: :not_acceptable
    end
  end

  private
  def comment_params
    @comment_params ||= params.require(:comment).permit(:name, :content)

  # リクエストボディが空の場合
  rescue ActionController::ParameterMissing
    render json: {data: "param is missing or the value is empty."}, status: :bad_request
    return
  end
end