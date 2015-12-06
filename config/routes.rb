Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :events do
  	resources :bids do
      collection do
        post 'make'
      end
    end
  end
end
