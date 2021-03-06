Rails.application.routes.draw do
  get 'doses/new'
  get 'cocktails/index'
  get 'cocktails/new'
  get 'cocktails/show'
  delete 'cocktails/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end
