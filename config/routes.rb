Rails.application.routes.draw do

  devise_for :users, path: 'cine', path_names: { sign_in: 'login', log_out: 'logout', sign_up: 'register'}
  
  root to: "home#index"

  resources :users do
    resources :assistants do
      resource :movies
    end
    end
end
