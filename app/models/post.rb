class Post < ApplicationRecord
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy
end
