module ResponseHelper
  extend ActiveSupport::Concern

  def render_success(data)
    render json: {
      data: data
    }
  end

  def validation_error(message)
    render json: { error: { message: message } }, status: 422
  end
end
