class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
  after_action :allow_iframe

  # GET /comments
  # GET /comments.json
  def index
    get_comment_list
  end

  # GET /comments/1
  # GET /comments/1.json
  #def show
  #end

  # GET /comments/new
  def new
    @newcomment = Comment.new
  end

  # GET /comments/1/edit
  #def edit
  #end

  # POST /comments
  # POST /comments.json
  def create
    @newcomment = Comment.new(comment_params)
    @newcomment.post_id = params[:post_id]
    @newcomment.public = true
    @newcomment.ipadress = request.remote_ip
    @newcomment.admin = false

    respond_to do |format|
      if @newcomment.save
        format.html { redirect_to comments_wrapper_path, notice: I18n.t("activerecord.models.comment") + I18n.t("notice.was_created") }
        #format.json { render :show, status: :created, location: @comment }
      else
        get_comment_list
        format.html { render :wrapper }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  #def update
  #  respond_to do |format|
  #    if @comment.update(comment_params)
  #      format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @comment }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @comment.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /comments/1
  # DELETE /comments/1.json
  #def destroy
  #  @comment.destroy
  #  respond_to do |format|
  #    format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  def wrapper
    index
    new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_comment
    #  @comment = Comment.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

    def get_comment_list
      @comments ||= Comment.where(post_id: params[:post_id], public: true)
    end

    def allow_iframe
      response.headers['X-Frame-Options'] = Rails.configuration.x.mod_response_header.x_frame_options
    end
end
