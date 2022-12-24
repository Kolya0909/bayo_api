module Api
  module V1
    class CompaniesController < Api::V1::ApiController
      swagger_controller :api_v1_companies, 'Companies flow', resource_path: 'Companies flow'

      swagger_api :create do
        summary 'Create new company'
        param :header, :authtoken, :string, :required, 'Main admin authtoken'
        param :form, :title, :string, :required, 'Company title'
        param :form, :description, :string, :required, 'Company description'
        param :form, :logo, :string, :optional, 'Company logo'
        param :form, :country, :string, :optional, 'Company country'
        param :form, :company_type, :string, :optional, 'Company type |producer or overbuying|'
        param :form, :time_of_send_order, :string, :optional, 'Company time of send order'
        param :form, :time_of_send_delivery, :string, :optional, 'Company time of send delivery'
        response :ok, 'Success'
      end

      def create
        current_main_admin_must_be && return
        service = CompanyFlow::Create.new(current_main_admin, params).call
        render_success service.as_api_response(:list)
      end

      swagger_api :show do
        summary 'Get company info'
        param :header, :authtoken, :string, :required, 'Main admin authtoken'
        param :path, :id, :string, :required, 'Company identifier'
        response :ok, 'Success'
      end

      def show
        current_main_admin_must_be && return
        render_success current_main_admin.companies.find_by(id: params[:id])
      end
    end
  end
end
