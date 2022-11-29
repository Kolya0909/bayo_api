module Authentication
  class Registration
    attr_reader :token
    def initialize(main_admin)
      @main_admin = main_admin
    end

    def call
      @token = JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE)
    end

    private
    attr_reader :main_admin

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
