Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users, path_names:  { sign_in: "login", sign_out: "logout" },
                     controllers: {
                                    registrations: "user/registrations"
                                  }


  #===============Api Routes================
  require 'api_constraints'

   namespace :api, defaults: { format: :json } do
       # scope per version of api
       scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

         resources :sessions, :only      => [:create, :destroy]
         match '/login'                  => 'sessions#create', :via => [:options, :post]
         post '/logout/:user_id'         => 'sessions#destroy'

         match '/reset_password'         => 'users#reset_password', :via => [:post]
         match '/users/:id'              => 'users#update', :via => [:options, :put, :post]
        #  get '/matches'                  => 'matches#show'

         resources :users, :only         => [:show, :create, :update]

         resources :dealerships, :only   => [:index, :show] do
           resources :sales_reps, :controller => 'sales_reps', :only => [:index, :show]
           resources :service_reps, :controller => 'service_reps', :only => [:index, :show]
         end

         resources :messages

         resources :conversations do
          resources :messages
         end
     end
   end
   #==========================================

  resources :users, only: [:index, :show, :destroy]
  resources :moderators, :controller => 'moderators'
  resources :sales_reps, :controller => 'sales_reps'
  resources :service_reps, :controller => 'service_reps'
  # devise_for :users

  resources :dealerships
  resources :push_notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
