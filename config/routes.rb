Rails.application.routes.draw do
  resources :employees

  root 'welcome#index'

  get 'signup' => 'employees#signup'

end
