class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_back_or_to_root
    redirect_to request.referrer || root_path
  end
end
