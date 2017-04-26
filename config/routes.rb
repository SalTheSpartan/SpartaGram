Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create , :destroy]
  end

  root 'posts#index'

  post 'upload_insta' => 'posts#upload_insta', as: :upload_insta

end
