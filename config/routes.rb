Rails.application.routes.draw do
  concern :commentable do
    resources :comments, only: %i[show new create]
  end

  resources :posts, concerns: :commentable
  resources :comments, only: [], concerns: :commentable

  root to: redirect('/posts')
end
