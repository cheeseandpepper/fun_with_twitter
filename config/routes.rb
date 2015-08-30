Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get :tweet_data, to: 'home#tweet_data', as: :tweet_data
end
