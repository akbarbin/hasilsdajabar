class Seller::DashboardsController < ApplicationController
  before_filter :authenticate_user!
  layout "seller"
  def index
  end

end
