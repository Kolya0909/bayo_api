module MainAdminFlow
  class Session

    attr_reader :token, :error_message, :main_admin

    def initialize(params)
      @email = params[:email]
      @password = params[:password]
      @error_message = nil
    end

    def call
      return @error_message = I18n.t('errors.email_or_password_incorrect') unless find_main_admin
      return @error_message = I18n.t('errors.email_or_password_incorrect') unless check_main_admin_password
      generate_token
      send_email
    end

    private
    attr_reader :email, :password

    def send_email
      MainAdminMailer.welcome_after_login(email).deliver_now
    end

    def generate_token
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
      @main_admin.admin_token.update!(token: @token)
    end

    def check_main_admin_password
      return unless main_admin
      main_admin.authenticate(password)
    end

    def find_main_admin
      @main_admin = MainAdmin.find_by(email: email)
    end

    def payload
      {
        :email => main_admin.email,
        :main_admin_id=> main_admin.id,
        :name => main_admin.name,
        :exp => Time.now.to_i + 12000
      }
    end
  end
end
