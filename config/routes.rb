Rails.application.routes.draw do
  resources :uploads, only: %i[index new create]
  match 'submit/:token' => 'uploads#edit', via: :get, as: :private_upload
  match 'submit/:token' => 'uploads#update', via: :patch, as: :private_submit
  # resources :uploads, param: :token, only: %i[edit update]
  devise_for :admins
  root to: 'visitors#index'
end
