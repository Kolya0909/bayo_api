module Api
  module V1
    class CategoriesController < Api::V1::ApiController

      swagger_controller :api_v1_categories, 'Categories Flow', resource_path: 'Categories Flow'

      swagger_api :index do
        summary 'Get categories'
        param :header, :authtoken, :string, :required, 'Main admin authtoken'
        response :ok, 'Success'
      end

      def index
        current_main_admin_must_be && return
        render_success Category.as_api_response(:list)
      end

      swagger_api :create do
        summary 'Create new category'
        param :header, :authtoken, :string, :required, 'Main admin authtoken'
        param :form, :title, :string, :optional, 'Category title'
        response :ok, 'Success'
      end

      def create
        current_main_admin_must_be && return
        render_success Category.create!(title: params[:title])
      end

    end
  end
end
