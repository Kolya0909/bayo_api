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
        post '/log_out' => 'registrations#log_out'
        post '/forgot_password' => 'registrations#forgot_password'
        post '/change_password' => 'registrations#change_password'
      end

      resources :main_admins, only: [] do
        get :profile, on: :collection
        put :profile_update, on: :collection
        delete :delete_profile, on: :collection
      end

      resources :companies, only: [:index, :create, :show, :update, :destroy]
    end
  end


end
