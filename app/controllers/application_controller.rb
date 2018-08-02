class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_current_menu


  def set_current_menu
    @current_menu = controller_name
  end
  

  private

  def layout_by_resource
    if devise_controller?
      "application"
    else
      "library"
    end
  end

end
