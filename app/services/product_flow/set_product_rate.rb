module ProductFlow
  class SetProductRate
    def initialize(current_customer, params)
      @product_id = params[:product_id]
      @rate = params[:rate]
      @current_customer = current_customer
    end

    def call

    end

    private

    attr_reader :product_id, :rate

    def user_can_set_rate?

    end



  end
end
