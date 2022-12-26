Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :campaigns, only: [:create] do
        collection do
          post :add_tag
        end
      end
      resources :topics, only: [:create]
      resources :comments, only: [:create]
      resources :tags, only: [:create]
      resources :sub_tags, only: [:create]
    end
  end
end
