json.extract! comment, :id, :body, :belongs_to, :created_at, :updated_at
json.url comment_url(comment, format: :json)
