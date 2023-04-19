module ProductFlow
  class SetProductRate

    attr_reader :error_message

    def initialize(current_customer, params)
      @product_id = params[:id]
      @rate = params[:rate]
      @current_customer = current_customer
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.user_cant_set_rate') unless user_can_set_rate?
      set_rate
      update_product_rating
    end

    private

    attr_reader :product_id, :rate, :current_customer

    def user_can_set_rate?
      current_customer.ratings.pluck(:product_id).exclude?(product_id.to_i)
    end

    def set_rate
      Rating.create!(user_id: current_customer.id,
                     product_id: product_id,
                     user_type: current_customer.class,
                     rate: rate)
    end

    def update_product_rating
      product = Product.find_by(id: product_id)
      all_ratings_count = product.ratings.count
      all_ratings = product.ratings.pluck(:rate).sum
      new_rating = all_ratings / all_ratings_count
      product.update_columns(rating: new_rating.to_i)
    end
  end
end
