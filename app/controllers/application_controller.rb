class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   customers_mypage_path
  # end

  # def after_sign_out_path_for(resource)
  #   homes_top_path
  # end

  def set_search
    @search = Item.ransack(params[:q])
    @search_products = @search.result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  before_action :set_search

end
