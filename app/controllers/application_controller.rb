class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authorize_page
    @day_limit = 250
    unless current_user
      flash[:notice] = "You must be logged in to access this page."
      redirect_to '/users/sign_in'
    end
  end
end
