Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  # API Definition
  namespace :api, default: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[create update show destroy]
      resources :tokens, only: [:create]
      resources :products
    end
  end
end
