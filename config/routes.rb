Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[new create]
  end
  resources :comments, only: [] do
    resources :comments, only: %i[new create]
  end
  root to: redirect('/posts')
end
