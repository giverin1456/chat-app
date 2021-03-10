Rails.application.routes.draw do
  devise_for :users
  root to:"rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]do
    resources :messages, only: [:index, :create]
  end
end

# なぜ”do"で繋がっているのか？
# resources→いつもの