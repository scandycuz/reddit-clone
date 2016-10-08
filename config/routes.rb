Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
  resources :subs, except: :destroy
  resources :posts, except: :index


  # root to: /

end
