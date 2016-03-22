Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/weefs/' => 'weefs#index'
  get '/weefs/:id' => 'weefs#show'

  get '/chats/:id' => 'chats#show'
  post '/chats/:id' => 'chats#create'

  get 'landing' => 'landings#index'

  namespace :api do
    namespace :v1 do  
      get "/posts" => "posts#index"
      post "/posts" => "posts#create"
      get "/posts/:id" => "posts#show"
      patch "/posts/:id" => "posts#update"
      delete "posts/:id" => "posts#destroy"

      get "/weefs/:id" => "weefs#show"
    end
  end

end
