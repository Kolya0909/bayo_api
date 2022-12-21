module Api
  module V1
    module Admin
      class RegistrationsController < Api::V1::ApiController

        swagger_controller :api_v1_admin_registrations, 'Main admin: auth', resource_path: 'Main admin: auth'


        swagger_api :sign_up do
          summary 'Main admin sign_up'
          param :form, :email, :string, :required, 'Main admin email'
          param :form, :name, :string, :required, 'Main admin name'
          param :form, :password, :string, :required, 'Main admin password'
          response :ok, 'Success'
        end

        def sign_up
          service = MainAdminFlow::Create.new(params)
          service.call

          return render_success service.main_admin
                                .as_api_response(:list)
                                .merge({token: service.token}) if service.main_admin

          validation_error(service.error_message)
        end

        swagger_api :sign_in do
          summary 'Main admin sign_in'
          param :form, :email, :string, :required, "Main admin email"
          param :form, :password, :string, :required, "Main admin password"
          response :ok, 'Success'
        end

        def sign_in
          service = MainAdminFlow::Session.new(params)
          service.call

          return validation_error(service.error_message) if service.error_message
          render_success service.main_admin
                                .as_api_response(:list)
                                .merge({ token: service.token })
        end

        swagger_api :forgot_password do
          summary 'Main admin reset password'
          param :form, :email, :string, :required, 'Main admin email'
          response :ok, 'Success'
        end

        def forgot_password
          service = MainAdminFlow::ForgotPassword.new(params[:email])
          service.call
          return validation_error(service.error_message) if service.error_message
          render_success true
        end

        swagger_api :change_password do
          summary 'Change main admin password'
          param :header, :authtoken, :string, :required, 'main admin authtoken'
          param :form, :old_password, :string, :required, 'main admin old password'
          param :form, :new_password, :string, :required, 'main admin new password'
          response :ok, 'Success'
        end

        def change_password
          current_main_admin_must_be && return
          service = MainAdminFlow::ChangePassword.new(current_main_admin, params)
          service.call
          return validation_error(service.error_message) if service.error_message

          render_success true
        end
      end
    end
  end
end


