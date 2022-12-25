module Api
  module V1
    module Customer
      class RegistrationsController < Api::V1::ApiController

        swagger_controller :api_v1_customer_registrations, 'Customer: auth', resource_path: 'Customer: auth'

      end
    end
  end
end
