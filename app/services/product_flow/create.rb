module ProductFlow
  class Create

    attr_reader :product

    def initialize(params)
      @params = params
      @product = nil
    end

    def call
      create_product
      create_product_info
    end

    private

    attr_reader :params, :product_options, :product_info_options

    def product_options
      @product_options ||= {
        name: params[:name],
        price: params[:price],
        category_ids: params[:category_ids],
        product_type: params[:product_type],
        product_status: params[:product_status],
        brand_id: params[:brand_id],
        company_id: params[:company_id]
      }
    end

    def create_product
      @product = Product.create!(product_options)
    end

    def product_info_options
      @product_info_options ||= {
        title: params[:title],
        description: params[:description],
        screen: params[:screen],
        processor: params[:processor],
        ram: params[:ram],
        memory: params[:memory],
        camera: params[:camera],
        product_id: @product.id
      }
    end

    def create_product_info
      ProductInfo.create!(product_info_options)
    end
  end
end
