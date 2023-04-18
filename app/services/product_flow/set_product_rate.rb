module ProductFlow
  class SetProductRate

    attr_reader :error_message

    def initialize(current_customer, params)
      @product_id = params[:product_id]
      @rate = params[:rate]
      @current_customer = current_customer
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.user_cant_set_rate') unless user_can_set_rate?
      set_rate
    end

    private

    attr_reader :product_id, :rate, :current_customer

    def user_can_set_rate?
      true unless current_customer.ratings
                               .pluck(:product_id)
                               .include?(product_id)
    end

    def set_rate
      Rating.create!(user_id: current_customer.id,
                     product_id: product_id,
                     user_type: current_customer.class,
                     rate: rate)
    end
  end
end
