module MainAdminFlow
  class Update

    def initialize(current_main_admin, params)
      @current_main_admin = current_main_admin
      @params = params
    end

    def call
      update_main_admin
    end

    private
    attr_reader :current_main_admin, :params, :options

    def options
      @options||= {
        name: params[:name],
        avatar: params[:avatar]
      }
    end

    def update_main_admin
      current_main_admin.update!(options)
    end

  end
end
