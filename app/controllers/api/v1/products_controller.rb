module Api
  module V1
    class ProductsController < Api::V1::ApiController

      swagger_controller :api_v1_products, "Products Flow", resource_path: "Products Flow"

      swagger_api :index do
        summary "Get all Products"
        param :header, :authtoken, :string, :required, "Main Admin authtoken"
        param :form, :search, :string, :optional, "Search products by key"
        param :form, :sort_by, :string, :optional, "Sort by name, price, rating"
        response :ok, "Success"
      end

      def index
        current_main_admin_must_be && return

      end

      swagger_api :show do
        summary "Get Product by id"
        param :header, :authtoken, :string, :required, "Main Admin authtoken"
        param :query, :id, :string, :required, "Product identifier"
        response :ok, "Success"
      end

      def show

      end

      swagger_api :create do
        summary "Create one Product"
        param :header, :authtoken, :string, :required, "Main Admin authtoken"
        param :form, :name, :string, :required, "Product name"
        param :form, :price, :string, :required, "Product price"
        param :form, :product_type, :string, :required, "telephon | smartphon | tablet | tv | laptop"
        param :form, :product_status, :string, :required, "in_stock | sold | delivery_expected"
        param :form, :category_ids, :string, :optional, "Category identifiers ',' separate"
        param :form, :brand_id, :string, :optional, "Brand identifier"
        param :form, :company_id, :string, :optional, "Company identifier"
        param :form, :title, :string, :optional, "Product info title"
        param :form, :description, :string, :optional, "Product info description"
        param :form, :screen, :string, :optional, "Product info screen"
        param :form, :processor, :string, :optional, "Product info processor"
        param :form, :ram, :string, :optional, "Product info ram"
        param :form, :memory, :string, :optional, "Product info memory"
        param :form, :camera, :string, :optional, "Product info camera"
        response :ok, "Success"
      end

      def create
        current_main_admin_must_be && return
        service = ProductFlow::Create.new(params)
        service.call
        render_success service.product.as_api_response(:list)
      end

    end
  end
end
