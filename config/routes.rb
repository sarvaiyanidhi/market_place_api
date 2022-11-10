Rails.application.routes.draw do
  # API Definition
  namespace :api, default: {format: :json} do
    namespace :v1 do
      resources :users, only: %i[create update show]
    end
  end
end
