Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount SwaggerUiEngine::Engine, at: "/api_docs"

  namespace :api do
    namespace :v1 do
      namespace :admin do
        post '/sign_up' => 'registrations#sign_up'
        post '/sign_in' => 'registrations#sign_in'

      end
    end
  end


end
