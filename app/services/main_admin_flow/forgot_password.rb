module MainAdminFlow
  class ForgotPassword
    HEX_COUNT = 10

    attr_reader :new_password, :error_message

    def initialize(email)
      @email = email
      @error_message, @new_password = nil
    end

    def call
      return @error_message = I18n.t('errors.user_with_this_email_doesnt_exist') unless find_main_admin
      change_password
      send_mail
    end

    private
    attr_reader :email

    def find_main_admin
      MainAdmin.find_by(email: email)
    end

    def change_password
      @new_password = SecureRandom.hex(HEX_COUNT)
      find_main_admin.update!(password: @new_password)
    end

    def send_mail
      MainAdminMailer.send_new_password(find_main_admin, @new_password).deliver_now
    end

  end
end
