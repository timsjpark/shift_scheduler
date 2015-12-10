Rails.application.routes.draw do
  default_url_options host: 'localhost', port:3000
  resources :shifts
  resources :employees, :managers
  resources :schedules, only: [:show]
  resources :organizations
  resources :departments

  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'console' => 'console#index'

  get 'signup' => 'employees#new_signup', as: 'new_signup'
  post '/employees' => 'employees#signup', as: 'signup'

  get 'login' => 'sessions#login', as: 'login'
  post 'login' => 'sessions#create'
  get "/auth/:provider/callback" => 'sessions#oauth'
  delete 'logout' => 'sessions#destroy'

  get '/calendar' => 'calendars#index'

  get 'organizations/join/:id' => 'organizations#join', as: 'join_organization'
  get '/switch/:id' => 'departments#switch', as: 'switch_department'

  get 'verification/:token' => 'employees#verify', as: 'verify_email'

  get 'email/schedule/:id' => 'schedules#email_schedule', as: 'email_schedule'
end
