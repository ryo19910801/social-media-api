Rails.application.routes.draw do
  mount SwaggerUiEngine::Engine, at: "/api_docs"
  get 'api/swagger.yaml', to: 'swagger#swagger'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resource :users, only: [:create, :update]
    end
  end
end
