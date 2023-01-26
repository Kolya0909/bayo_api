module Api
  module V1
    class ApiController < ActionController::API
      include Swagger::Docs::Methods
      include ActionController::Caching

      def current_main_admin_must_be
        if current_main_admin.nil?
          render_auth_error
          return true
        end
        false
      end

      def current_main_admin
        service = MainAdminFlow::MainAdminAuth.new(get_auth_token)
        service.call
        @current_main_admin||= service.main_admin
      end

      def current_customer_must_be
        if current_customer.nil?
          render_auth_error
          return true
        end
          false
      end

      def current_customer
        service = CustomerFlow::CustomerAuth.new(get_auth_token)
        service.call
        @current_customer ||= service.customer
      end

      def get_auth_token
        request.headers['authtoken']
      end

      def render_auth_error
        render json: {
          error: {
            message: I18n.t('errors.you_must_sign_in_for_continue')
          }
        }, status: 401
      end

      def render_success(data)
        render json: {
          data: data
        }
      end

      def validation_error(message)
        render json: { error: { message: message } }, status: 422
      end
    end
  end
end

