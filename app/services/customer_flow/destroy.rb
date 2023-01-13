module CustomerFlow
  class Destroy
    def initialize(current_customer)
      @current_customer = current_customer
    end

    def call
      destroy_customer
    end

    private
    attr_reader :current_customer

    def destroy_customer
      current_customer.destroy
    end
  end
end
