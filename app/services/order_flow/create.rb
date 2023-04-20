module OrderFlow
  class Create

    attr_reader :error_message

    STATUS_NEW_ORDER = "Created".freeze

    def initialize(current_customer)
      @current_customer = current_customer
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.customer_cant_create_order') if current_customer.basket.basket_products.empty?
      create_order
      create_order_product
    end

    private

    attr_reader :current_customer, :order, :order_product

    def create_order
      @order = Order.create!(status: STATUS_NEW_ORDER, approved: false, customer_id: current_customer.id)
    end

    def create_order_product
      @order_product = OrderProduct.create!(order_id: @order.id, basket_products: basket_products)
      remove_products_from_basket if @order_product
    end

    def basket_products
      current_customer.basket.basket_products
    end

    def remove_products_from_basket
      current_customer.basket.basket_products.destroy_all
    end
  end
end
