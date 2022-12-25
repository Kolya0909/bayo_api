module CustomerFlow
  class Logout
    def initialize(current_customer)
      @current_customer = current_customer
    end

    def call
      destroy_customer_session!
    end

    private
    attr_reader :current_customer

    def destroy_customer_session!
      current_customer.customer_token.update!(token: nil)
    end
  end
end
