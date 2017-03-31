Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"
  resources :homes
  resources :accounts
  resources :ewallets

  get '/home' => "homes#index"
  get '/ringgit' => "ewallets#ringgit"
  get '/rupiah' => "ewallets#rupiah"
  get '/sing' => "ewallets#sing"
  get '/baht' => "ewallets#baht"

end
