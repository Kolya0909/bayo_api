module Api
  module V1
    module Admin
      class RegistrationsController < Api::V1::ApiController

        swagger_controller :api_v1_admin_registrations, 'Main admin: registrations', resource_path: 'Main admin: registrations'


        swagger_api :sign_up do
          summary 'Main admin sign_up'
          param :form, :email, :string, :required, 'Main admin email'
          param :form, :name, :string, :required, 'Main admin name'
          param :form, :password, :string, :required, 'Main admin password'
          param :form, :password_confirmation, :string, :required, 'Main admin email'
          response :ok, 'Success'
        end

        def sign_up
          return if MainAdmin.find_by_email(params[:email])
          redirect_to swagger_ui_engine_path
        end

        def sign_in
          render json: { message: "Welcome!" }
        end

      end
    end
  end
end


