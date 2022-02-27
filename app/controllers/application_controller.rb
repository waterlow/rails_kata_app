class ApplicationController < ActionController::API
  def health_check
    render plain: 'ok'
  end

  def sample
    render plain: 'v1'
  end
end
