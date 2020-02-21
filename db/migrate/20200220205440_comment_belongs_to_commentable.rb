class CommentBelongsToCommentable < ActiveRecord::Migration[6.0]
  def change
    remove_belongs_to :comments, :post
    add_belongs_to :comments, :commentable, polymorphic: true
  end
end
