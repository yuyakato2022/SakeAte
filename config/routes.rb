Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admin_users, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin_user/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/recipes#top'

  namespace :admin_user do
    get '/' => 'recipes#top'
    resources :alcohols, only:[:index, :edit, :create, :update]
    resources :recipes do
      resources :reviews, only:[:create, :destroy]
    end
    resources :users, only:[:index, :show, :edit, :update]
    get "search" => "searches#search"
  end

  namespace :public do
    resources :recipes, only:[:index, :show] do
     resources :reviews, only:[:create, :destroy]
    end
    resources :bookmark, only:[:create, :destroy]
    resource :users, only:[:show, :edit, :update]
    get "search" => "searches#search"
  end

end
