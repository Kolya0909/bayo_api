module Api
  module V1
    class ApiController < ActionController::API
      include Swagger::Docs::Methods
      include ActionController::Caching

      def render_success(data)
        render json: {
          result: data
        }
      end
    end
  end
end

