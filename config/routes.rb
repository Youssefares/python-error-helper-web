Rails.application.routes.draw do
  get 'error/index'
  post 'error/help'
  root 'error#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
