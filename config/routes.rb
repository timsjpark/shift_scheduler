Rails.application.routes.draw do
  resources :employees

  root 'welcome#index'

  get 'signup' => 'employees#new_signup', as: 'new_signup'
  post '/employees' => 'employees#signup', as: 'signup'

end
