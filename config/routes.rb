Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins
  
  root to: "welcome#index" # quando acessar localhost:3000 cai na pagina welcome/index
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
