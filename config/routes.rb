LiveRails::Application.routes.draw do

  get 'login', to: 'web_ui#login'
  post 'login', to: 'web_ui#sessions', as: :sessions
  delete 'logout', to: 'web_ui#logout', as: :logout

  get 'home', to: 'web_ui#home'
  get 'admin', to: 'web_ui#admin'
  get 'register', to: 'web_ui#register'
  post 'register', to: 'users#create'

  root 'web_ui#index'
end
