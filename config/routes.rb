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

  root 'posts#show'
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch 'posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/users/:id' => 'users#show'
  delete '/users/:id' => 'users#destroy'

  get '/weefs/' => 'weefs#index'

end
