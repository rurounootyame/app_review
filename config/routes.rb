Rails.application.routes.draw do
#devise_forとresourcesの記述の順番が違うことでtoo many redirect errorが起こった。
#記載の順番に注意が必要であると知った。
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :apps, only: [:index, :show, :create, :edit, :update, :destroy]
  root to: "homes#top"
  get 'home/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
