module Api
  module V1
    class ApiController < ActionController::API
      include Swagger::Docs::Methods
      include ActionController::Caching
      include ResponseHelper

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
    end
  end
end

