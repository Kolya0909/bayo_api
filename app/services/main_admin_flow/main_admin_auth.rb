module MainAdminFlow
  class MainAdminAuth
    attr_reader :main_admin

    def initialize(token)
      @token = token
      @main_admin = nil
    end

    def call
      return unless @token
      get_token_data
      get_main_admin
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

    def get_main_admin
      return unless get_token_data
      result = MainAdmin.find_by(email: get_token_data["email"])
      @main_admin = result if result&.admin_token&.token.eql?(token)
    end
  end
end
