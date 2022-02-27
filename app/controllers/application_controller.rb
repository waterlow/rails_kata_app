class ApplicationController < ActionController::API
  def health_check
    render plain: 'ok'
  end

  def sample
    render plain: 'v2'
  end
end
