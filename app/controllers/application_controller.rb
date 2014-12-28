class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user_by_type_user

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      return admin_users_path
    elsif current_user.is_seller?
      return seller_dashboards_path
    elsif current_user.is_wholeseller?
      return wholeseller_dashboards_path
    elsif current_user.is_buyer?
      return buyer_dashboards_path
    end
  end

  def type_user_path(status)
    "/#{status}/dashboards"
  end
  helper_method :type_user_path

  # kalau params controller sama dengan type user
  def authenticate_user_by_type_user
    controller = params[:controller].split("/").first
    if ["order", "wholeseller", "buyer"].include?(controller)
      if current_user.present?
        if current_user.type_user.downcase != controller
          flash[:error] = "Tidak bisa akses halaman tersebut"
          redirect_to type_user_path(current_user.type_user.downcase)
        end
      end
    end
  end
end