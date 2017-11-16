Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :adverts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'adverts#index'
end
