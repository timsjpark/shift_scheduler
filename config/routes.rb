Rails.application.routes.draw do
  resources :shifts
  resources :employees, :managers

  root 'welcome#index'

  get 'signup' => 'employees#new_signup', as: 'new_signup'
  post '/employees' => 'employees#signup', as: 'signup'

  get 'login' => 'sessions#login', as: 'login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
