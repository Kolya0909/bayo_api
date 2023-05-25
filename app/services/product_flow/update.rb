module ProductFlow
  class Update

    attr_reader :product

    def initialize(params)
      @params = params
      @product = Product.find_by(id: params[:id])
    end

    def call
      update_product!
      update_product_info!
    end

    private
    attr_reader :product_options, :product_info_options, :params

    def product_options
      @product_options ||= {
        name: params[:name] || product.name,
        price: params[:price] || product.price,
        product_type: params[:product_type] || product.product_type,
        product_status: params[:product_status] || product.product_status,
        category_ids: params[:category_ids] || product.category_ids,
        brand_id: params[:brand_id] || product.brand_id,
        company_id: params[:company_id] || product.company_id,
      }
    end

    def product_info_options
      @product_info_options ||= {
        title: params[:title] || product.product_info.title,
        description: params[:description] || product.product_info.description,
        screen: params[:screen] || product.product_info.screen,
        processor: params[:processor] || product.product_info.processor,
        ram: params[:ram] || product.product_info.ram,
        memory: params[:memory] || product.product_info.memory,
        camera: params[:camera] || product.product_info.camera,
      }
    end

    def update_product!
      product.update!(product_options)
    end

    def update_product_info!
      product.product_info.update!(product_info_options)
    end
  end
end