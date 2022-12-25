module CustomerFlow
  class ForgotPassword
    HEX_COUNT = 10

    attr_reader :new_password, :error_message

    def initialize(email)
      @email = email
      @error_message, @new_password = nil
    end

    def call
      return @error_message = I18n.t('errors.user_with_this_email_doesnt_exist') unless find_customer
      change_password
      send_mail
    end

    private
    attr_reader :email

    def find_customer
      Customer.find_by(email: email)
    end

    def change_password
      @new_password = SecureRandom.hex(HEX_COUNT)
      find_customer.update!(password: @new_password)
    end

    def send_mail
      CustomerMailer.send_new_password(find_customer, @new_password).deliver_now
    end

  end
end
