module Authentication
  class Registration

    def initialize(user)
      @user = user
    end

    def call
      {
        token: JWT.encode(payload, JWT_SERVER_SECRET_TOKEN, HASH_CODE),
        user: payload
      }
    end

    private
    attr_reader :user

    def payload
      {
        :email => user.email,
        :user_id=> user.id,
        :name => user.name,
        :exp => Time.now.to_i + 12000
      }
    end
  end
end
