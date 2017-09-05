Rails.application.routes.draw do
  devise_for :admins
  get 'error/index'
  get 'error/list'
  post 'error/help'

  post 'rubocop/webhook/', to: 'rubocop#webhook'

  Rails.application.routes.draw do
    resources :error
    root 'error#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
