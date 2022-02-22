Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :superpowers, only: %i[index new create show] do
    resources :bookings, only: %i[index new create]
  end
end
