module Api
  module V1
    class MainAdminsController < Api::V1::ApiController
      swagger_controller :api_v1_main_admins, 'Main admin flow', resource_path: 'Main admin flow'

      swagger_api :profile do
        summary 'Get info about main admin'
        param :header, :authtoken, :string, :required, 'main admin authtoken'
        response :ok, 'Success'
      end

      def profile
        current_main_admin_must_be && return
        render_success(current_main_admin.as_api_response(:list))
      end

      swagger_api :profile_update do
        summary 'Update main admin profile'
        param :header, :authtoken, :string, :required, 'main admin authtoken'
        param :form, :name, :string, :required, 'main admin name'
        response :ok, 'Success'
      end

      def profile_update

      end

    end
  end
end
