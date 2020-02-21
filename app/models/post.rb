class Post < ApplicationRecord
  validates :title, :body, presence: true

  has_many :comments, as: :commentable, dependent: :destroy
end
