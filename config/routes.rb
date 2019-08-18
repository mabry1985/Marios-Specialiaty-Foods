Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :tokens, only: [:create]
  resources :products do
    resources :reviews
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/all_products" => "products#all"
  post 'products/search' => 'products#search', as: 'search_products'
  # post 'tokens' => "tokens#create"
  get '/chat' => 'chats#show'

end
