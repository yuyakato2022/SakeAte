Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :admin_users, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin_user/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'
  
  namespace :admin_user do
    get '/' => 'homes#top'
    resources :alcohols, only:[:index, :edit, :create, :update]
    resources :recipes
    resources :user, only:[:index, :show, :edit, :update]
    get "search" => "searches#search"
  end
  
  namespace :public do
    resources :recipes, only:[:index, :show]
    resources :reviews, only:[:create, :destroy]
    resources :bookmark, only:[:create, :destroy]
    resource :user, only:[:index, :edit, :update]
    get "search" => "searches#search"
  end

end
