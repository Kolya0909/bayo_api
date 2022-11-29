module MainAdminFlow
  class Create

    attr_reader :error_message, :main_admin, :token

    def initialize(params)
      @params = params
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
      @error_message = nil
    end

    def call
      return @error_message = "email was used#{params}" if main_admin_was_created?
      return @error_message = "password is invalid" unless password_equal_password_confirmation?
      create_main_admin!
    end

    private
    attr_reader :params, :password, :password_confirmation

    def create_main_admin!
      @main_admin = MainAdmin.create!(main_admin_params)
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
    end

    def main_admin_was_created?
      MainAdmin.find_by_email(params[:email])
    end

    def password_equal_password_confirmation?
      password.eql?(password_confirmation)
    end

    def payload
      {
        :email => @main_admin.email,
        :main_admin_id=> @main_admin.id,
        :name => @main_admin.name,
        :exp => Time.now.to_i + 12000
      }
    end

    def main_admin_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end