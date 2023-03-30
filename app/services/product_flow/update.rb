module ProductFlow
  class Update

    attr_reader :product

    def initialize(params)
      @params = params
    end

    def call
      update_product!
    end

    private
    attr_reader :options, :params

    def options
      @options ||= {
        name: params[:name] || product.name,
        price: params[:price] || product.price,
        product_type: params[:product_type] || product.product_type,
        product_status: params[:product_status] || product.product_status,
        category_ids: params[:category_ids] || product.category_ids,
        brand_id: params[:brand_id] || product.brand_id,
        company_id: params[:company_id] || product.company_id,
        title: params[:title] || product.title,
        screen: params[:screen] || product.screen,
        processor: params[:processor] || product.processor,
        ram: params[:ram] || product.ram,
        memory: params[:memory] || product.memory,
        camera: params[:camera] || product.camera,
      }
    end

    def update_product!
      product.update!(options)
    end

    def product
      @product ||= Product.find_by(id: params[:id])
    end
  end
end