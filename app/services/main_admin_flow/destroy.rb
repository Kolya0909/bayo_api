module MainAdminFlow
  class Destroy
    def initialize(current_main_admin)
      @current_main_admin = current_main_admin
    end

    def call
      destroy_main_admin
    end

    private
    attr_reader :current_main_admin

    def destroy_main_admin
      current_main_admin.destroy
    end
  end
end
