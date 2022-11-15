Rails.application.routes.draw do
  get 'input' => 'pages#input'
  get 'result' => 'pages#result'
  get 'pages/result'

  root 'pages#input', as: :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
