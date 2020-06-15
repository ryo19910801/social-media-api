Rails.application.routes.draw do
  mount SwaggerUiEngine::Engine, at: "/api_docs"
  get 'api/swagger.yaml', to: 'swagger#swagger'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:create]
      patch "users"  => "users#update"
    end
  end
end
