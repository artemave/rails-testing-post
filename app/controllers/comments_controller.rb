class CommentsController < ApplicationController
  before_action :set_commentable

  # GET /comments/new
  def new
    @comment = @commentable.comments.new
  end

  # POST /comments
  def create
    @comment = @commentable.comments.build(comment_params)

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

  def set_commentable
    @commentable ||= begin
                       commentable_class = [Comment, Post].find do |k|
                         params["#{k.name.underscore}_id"]
                       end
                       commentable_class.find(params["#{commentable_class.name.underscore}_id"])
                     end
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
