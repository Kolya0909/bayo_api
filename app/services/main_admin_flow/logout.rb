module MainAdminFlow
  class Logout
    def initialize(current_main_admin)
      @current_main_admin = current_main_admin
    end

    def call
      destroy_main_admin_session!
    end

    private
    attr_reader :current_main_admin

    def destroy_main_admin_session!
      current_main_admin.admin_token.update!(token: nil)
    end
  end
end
