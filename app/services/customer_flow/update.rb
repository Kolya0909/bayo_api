module CustomerFlow
  class Update

    def initialize(current_customer, params)
      @current_customer = current_customer
      @params = params
    end

    def call
      update_customer
    end

    private
    attr_reader :current_customer, :params, :options

    def options
      @options||= {
        name: params[:name],
        avatar: params[:avatar]
      }
    end

    def update_customer
      current_customer.update!(options)
    end
  end
end
