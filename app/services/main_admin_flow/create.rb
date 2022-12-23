module MainAdminFlow
  class Create

    attr_reader :error_message, :main_admin, :token

    def initialize(params)
      @params = params
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.email_was_used') if main_admin_was_created?
      create_main_admin!
    end

    private
    attr_reader :params

    def create_main_admin!
      @main_admin = MainAdmin.create!(main_admin_params)
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
      AdminToken.create!(main_admin_id: @main_admin.id, token: @token)
    end

    def main_admin_was_created?
      MainAdmin.find_by_email(params[:email])
    end

    def payload
      {
        :email => @main_admin.email,
        :main_admin_id=> @main_admin.id,
        :name => @main_admin.name,
        :password => params[:password],
        :exp => Time.now.to_i + 12000
      }
    end

    def main_admin_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end