module Api
  module V1
    class ApiController < ActionController::API
      include Swagger::Docs::Methods
      include ActionController::Caching
      include ResponseHelper
    end
  end
end

