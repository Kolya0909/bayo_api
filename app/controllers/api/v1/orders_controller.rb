module Api
  module V1
    class OrdersController < Api::V1::ApiController

      swagger_controller :api_v1_orders, 'Order Flow', resource_path: 'Order Flow'

      swagger_api :index do
        summary 'Show orders'
        param :header, :authtoken, :string, :required, "Customer authtoken"
        response :ok, 'Success'
      end

      def index
        current_customer_must_be && return

        render_success current_customer.orders.as_api_response(:list)
      end


      swagger_api :create do
        summary 'Create order'
        param :header, :authtoken, :string, :required, "Customer authtoken"
        response :ok, 'Success'
      end

      def create
        current_customer_must_be && return

        service = OrderFlow::Create.new(current_customer)
        service.call

        return validation_error(service.error_message) if service.error_message

        render_success true
      end

    end
  end
end
