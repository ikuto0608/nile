Rails.application.routes.draw do
  resources :offer_deliveries
  resources :request_deliveries
  defaults format: :json do
    resources :wishlists
    resources :user_locations
    resources :transactions
    resources :reviews
    resources :locations
    resources :users do
      collection do
        get :possible_delivers
        get :wishlists_of
      end

      member do
        get :reviews
        get :wishlists
        get :user_locations
      end
    end
    post 'tokens', to: 'tokens#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
