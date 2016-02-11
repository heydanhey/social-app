Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   authenticated :user do
     root 'posts#show', as: :authenticated_root
   end

   unauthenticated do
     root 'devise/registrations#new', as: :unauthenticated_root
   end
 end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'posts#index'
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch 'posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

end
