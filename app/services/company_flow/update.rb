module CompanyFlow
  class Update
    def initialize(current_main_admin, params, company_id)
      @current_main_admin = current_main_admin
      @params = params
      @company_id = company_id
    end

    def call
      update_company
    end

    private
    attr_reader :current_main_admin, :params, :company_id

    def get_company
      current_main_admin.companies.find_by(id: company_id)
    end

    def update_company
      get_company.update!(company_params)
    end

    def company_params
      params.permit(:title, :description, :logo, :country, :company_type, :time_of_send_order, :time_of_send_delivery)
    end

  end
end
