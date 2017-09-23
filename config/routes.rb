Rails.application.routes.draw do
  defaults format: :json do
    resources :wishlists
    resources :user_locations
    resources :transactions
    resources :reviews
    resources :locations
    resources :users
    post 'tokens', to: 'tokens#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
