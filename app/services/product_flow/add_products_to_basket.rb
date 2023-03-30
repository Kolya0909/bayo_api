module ProductFlow
  class AddProductsToBasket
    def initialize(current_customer, product_ids)
      @current_customer = current_customer
      @product_ids = product_ids
    end

    def call
      create_basket_products!
    end

    private

    attr_reader :current_customer, :product_ids

    def create_basket_products!
      product_ids_array.each do |product_id|
        BasketProduct.create!(customer_id: current_customer.id,
                              product_id: product_id)
      end
    end

    def product_ids_array
      product_ids.split(',')
    end
  end
end