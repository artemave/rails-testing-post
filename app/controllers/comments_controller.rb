class CommentsController < ApplicationController
  before_action :set_post

  # GET /comments/new
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /comments
  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
