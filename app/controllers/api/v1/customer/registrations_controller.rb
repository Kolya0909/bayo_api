module Api
  module V1
    module Customer
      class RegistrationsController < Api::V1::ApiController

        swagger_controller :api_v1_customer_registrations, 'Customer: auth', resource_path: 'Customer: auth'

        swagger_api :sign_up do
          summary 'Customer sign_up'
          param :form, :email, :string, :required, 'Customer email'
          param :form, :name, :string, :required, 'Customer name'
          param :form, :avatar, :string, :optional, 'Customer avatar'
          param :form, :password, :string, :required, 'Customer password'
          response :ok, 'Success'
        end

        def sign_up
          service = CustomerFlow::Create.new(params)
          service.call

          return render_success service.customer
                                       .as_api_response(:list)
                                       .merge({token: service.token}) if service.customer

          validation_error(service.error_message)
        end

        swagger_api :sign_in do
          summary 'Customer sign_in'
          param :form, :email, :string, :required, "Customer email"
          param :form, :password, :string, :required, "Customer password"
          response :ok, 'Success'
        end

        def sign_in
          service = CustomerFlow::Session.new(params)
          service.call

          return validation_error(service.error_message) if service.error_message
          render_success service.customer
                                .as_api_response(:list)
                                .merge({ token: service.token })
        end

        swagger_api :log_out do
          summary 'Logout of service'
          param :header, :authtoken, :string, :required, 'Customer authtoken'
          response :ok, 'Success'
        end

        def log_out
          current_customer_must_be && return
          CustomerFlow::Logout.new(current_customer).call
          render_success I18n.t('messages.sessions_was_destroyed')
        end

        swagger_api :forgot_password do
          summary 'Customer reset password'
          param :form, :email, :string, :required, 'Customer email'
          response :ok, 'Success'
        end

        def forgot_password
          service = CustomerFlow::ForgotPassword.new(params[:email])
          service.call
          return validation_error(service.error_message) if service.error_message
          render_success true
        end

      end
    end
  end
end
