module CustomerFlow
  class CustomerAuth
    attr_reader :customer

    def initialize(token)
      @token = token
      @customer = nil
    end

    def call
      return unless @token
      get_token_data
      get_customer
    end

    private
    attr_reader :token

    def get_token_data
      begin
        JWT.decode(token, JWT_SERVER_SECRET_TOKEN, HASH_CODE).first
      rescue JWT::ExpiredSignature
      rescue JWT::VerificationError
      rescue JWT::DecodeError
      end
    end

    def get_customer
      return unless get_token_data
      result = Customer.find_by(email: get_token_data["email"])
      @customer = result if result.customer_token.token.eql?(token)
    end
  end
end

