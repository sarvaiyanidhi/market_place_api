Rails.application.routes.draw do
  # API Definition
  namespace :api, default: {format: :json} do
    namespace :v1 do
      # Resource Listing here
    end
  end
end
