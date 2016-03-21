Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'events#index'
  devise_for :users
  resources :user_achievements
  resources :users do
    resources :achievements, namespace: 'badges'
    resources :shields
  end

  resources :events do
  	resources :bids do
      collection do
        post 'make'
      end
    end
  end
end
