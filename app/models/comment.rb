class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true

  def post
    post = commentable
    post = post.commentable while post.respond_to?(:commentable)
    post
  end
end
