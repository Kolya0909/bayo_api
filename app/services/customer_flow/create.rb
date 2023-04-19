module CustomerFlow
  class Create

    attr_reader :error_message, :customer, :token

    def initialize(params)
      @params = params
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.email_was_used') if customer_was_created?
      create_customer!
      create_customer_basket!
    end

    private
    attr_reader :params

    def create_customer!
      @customer = Customer.create!(customer_params)
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
      CustomerToken.create!(customer_id: @customer.id, token: @token)
    end

    def customer_was_created?
      Customer.find_by_email(params[:email])
    end

    def payload
      {
        :email => @customer.email,
        :customer_id=> @customer.id,
        :name => @customer.name,
        :exp => Time.now.to_i + 12000
      }
    end

    def create_customer_basket!
      Basket.create!(customer_id: @customer.id)
    end

    def customer_params
      params.permit(:name, :email, :password, :avatar)
    end
  end
end