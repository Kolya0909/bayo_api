module Api
  module V1
    class CustomersController < Api::V1::ApiController
      swagger_controller :api_v1_customers, 'Customer: Profile', resource_path: 'Customer: Profile'

      swagger_api :profile do
        summary 'Get info about customer'
        param :header, :authtoken, :string, :required, 'Customer authtoken'
        response :ok, 'Success'
      end

      def profile
        current_customer_must_be && return
        render_success(current_customer.as_api_response(:list))
      end

      swagger_api :profile_update do
        summary 'Update customer profile'
        param :header, :authtoken, :string, :required, 'Customer authtoken'
        param :form, :name, :string, :optional, 'Customer name'
        param :form, :avatar, :string, :optional, 'Customer avatar'
        response :ok, 'Success'
      end

      def profile_update
        current_customer_must_be && return
        CustomerFlow::Update.new(current_customer, params).call
        render_success current_customer.as_api_response(:list)
      end

      swagger_api :delete_profile do
        summary 'Delete customer profile'
        param :header, :authtoken, :string, :required, 'Customer authtoken'
        response :ok, 'Success'
      end

      def delete_profile
        current_customer_must_be && return
        CustomerFlow::Destroy.new(current_customer).call
        render_success I18n.t('messages.profile_was_deleted')
      end
    end
  end
end
