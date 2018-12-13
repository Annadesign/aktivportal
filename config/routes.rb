Rails.application.routes.draw do

 # match "/404", :to => "errors#not_found", :via => :all
 # match "/500", :to => "errors#internal_server_error", :via => :all

 # get 'password_resets/new'

  root to: 'events#index'
 
 # === ADMINISTRATOR ===
  get '/admin' => 'admin/sessions#new'
  get '/login' => 'admin/sessions#index'
  get '/logout' => 'admin/sessions#destroy'

 # get 'admin/images/list' => 'admin/images#list'
 # get 'admin/photos/list' => 'admin/photos#list'

  namespace :admin do
  	resources :dashboard, only: [:index]
    resources :sessions, only: [:index, :create, :destroy]
    resources :users, only: [:index, :new, :create, :edit, :update]
    resources :articles, only: [:index, :new, :create, :edit, :update]
    resources :organizations, only: [:index, :new, :create, :edit, :update]
    resources :providers, only: [:index, :new, :create, :edit, :update]
    resources :events
    resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :images, only: [:index, :new, :create, :edit, :update, :destroy]

  end  

  namespace 'api' do
    namespace 'v1' do
      resources :events
    end
  end
# === END ADMINISTRATOR ===

   resources :events do
    collection do 
      get :search, :action => 'search_event', :as => 'search_event'
      get 'search/:q', :action => 'search', :as => 'search'
    end
  end

  resources :password_resets

  resources :sessions, only: [:index, :create, :destroy]
  
  resources :events, only: [:index, :show]



end
