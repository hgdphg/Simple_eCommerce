class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  include CurrentCart
  before_action :set_cart

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_path, notice: "Need login"
      end
    end

end
