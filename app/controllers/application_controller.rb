class ApplicationController < ActionController::API
  def health_check
    render plain: 'ok'
  end
end
