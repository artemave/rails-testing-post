class CommentsController < ApplicationController
  before_action :set_commentable

  def show
    @comment = @commentable.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.new
  end

  # POST /comments
def create
  @comment = @commentable.comments.build(comment_params)

  respond_to do |format|
    if @comment.save
      format.html { redirect_to [@commentable, @comment], notice: 'Comment was successfully created.' }
      format.turbo_stream
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end
end

  private

  def set_commentable
    commentable_class = [Comment, Post].find do |k|
      params["#{k.name.underscore}_id"]
    end
    @commentable = commentable_class.find(params["#{commentable_class.name.underscore}_id"])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
