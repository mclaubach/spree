Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :matches, only: [:index, :show]

  resources :events do
  	resources :bids do
      collection do
        post 'make'
      end
    end
  end
end
