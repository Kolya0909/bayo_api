module CustomerFlow
  class Session

    attr_reader :token, :error_message, :customer

    def initialize(params)
      @email = params[:email]
      @password = params[:password]
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.email_or_password_incorrect') unless find_customer
      return @error_message = I18n.t('errors.email_or_password_incorrect') unless check_customer_password
      generate_token
    end

    private
    attr_reader :email, :password

    def generate_token
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
      @customer.customer_token.update!(token: @token)
    end

    def check_customer_password
      return unless customer
      customer.authenticate(password)
    end

    def find_customer
      @customer = Customer.find_by(email: email)
    end

    def payload
      {
        :email => customer.email,
        :customer_id=> customer.id,
        :name => customer.name,
        :exp => Time.now.to_i + 12000
      }
    end
  end
end
