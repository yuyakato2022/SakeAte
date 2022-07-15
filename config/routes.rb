Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin_user, controllers: {
    sessions: "admin_user/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get '/users', to: redirect("/users/sign_up")
  end

  root to: 'public/recipes#top'

  namespace :admin_user do
    get '/' => 'recipes#top'
    resources :recipes do
      resources :reviews, only:[:create, :destroy]
    end
    resources :alcohols, only:[:index, :edit, :create, :destroy]
    patch  'alcohols/:id/edit' => 'alcohols#update'#URL変更のため別途記述
    resources :users, only:[:index, :show, :edit, :update]
    get "search" => "searches#search"
  end

  namespace :public do
    resources :recipes, only:[:index, :show] do
      resources :reviews, only:[:create, :destroy]
      resource :bookmarks, only:[:create, :destroy]
    end
    resource :user, only:[:show, :edit, :update]
    patch 'users/withdraw' => 'users#withdraw'
    get 'users/quit' => 'users#quit'
    get "search" => "searches#search"
  end

end