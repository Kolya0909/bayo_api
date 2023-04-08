module Api
  module V1
    class ProductsController < ApiController

      swagger_controller :api_v1_products, "Products Flow", resource_path: "Products Flow"

      swagger_api :index do
        summary "Get all Products"
        param :query, :search, :string, :optional, "Search products by key"
        param :query, :sort_by, :string, :optional, "Sort by name, price, rating"
        param :query, :filter_by_product_status, :string, :optional, "Filter by product status in_stock | sold | delivery_expected]"
        param :query, :filter_by_product_type, :string, :optional, "Filter by product type telephon | smartphon | tablet | tv | laptop"
        response :ok, "Success"
      end

      def index
        products = FindProducts.new(Product.includes(:product_info), params).call
        render_success products.as_api_response(:list)
      end

      swagger_api :show do
        summary "Get Product by id"
        param :path, :id, :string, :required, "Product identifier"
        response :ok, "Success"
      end

      def show
        product = Product.find_by(id: params[:id])
        render_success product.as_api_response(:show)
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

      swagger_api :update do
        summary "Update one Product"
        param :header, :authtoken, :string, :required, "Main Admin authtoken"
        param :path, :id, :string, :required, "Product identifier"
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

      def update
        current_main_admin_must_be && return
        service = ProductFlow::Update.new(params)
        service.call
        render_success service.product.as_api_response(:list)
      end

      swagger_api :destroy do
        summary "Delete product"
        param :header, :authtoken, :string, :required, "Main admin authtoken"
        param :path, :id, :string, :required, "Product identifier"
        response :ok, "Success"
      end

      def destroy
        product = Product.find_by(id: params[:id])
        render_success "Deleted" if product.destroy!
      end

      swagger_api :add_products_to_basket do
        summary "Add products to basket"
        param :header, :authtoken, :string, :required, "Customer authtoken"
        param :form, :product_ids, :string, :required, "Product identifiers example '12,23,45'"
        response :ok, "Success"
      end

      def add_products_to_basket
        current_customer_must_be && return
        service = ProductFlow::AddProductsToBasket.new(current_customer, params[:product_ids])

        render_success service.call
      end



    end
  end
end
