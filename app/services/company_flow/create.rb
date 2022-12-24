module CompanyFlow
  class Create

    def initialize(current_main_admin, params)
      @current_main_admin = current_main_admin
      @params = params
      @company = nil
    end

    def call
      create_company
    end

    private
    attr_reader :current_main_admin, :params, :options

    def create_company
      current_main_admin.companies.create!(company_params)
    end

    def company_params
      params.permit(:title, :description, :logo, :country, :company_type, :time_of_send_order, :time_of_send_delivery)
    end

  end
end
