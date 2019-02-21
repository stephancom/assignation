class ApplicationController < ActionController::Base
  def pundit_user
    current_admin
  end
end
