class Buyer::DashboardsController < ApplicationController
  before_filter :authenticate_user!
  layout "buyer"

  def index
    @total_bergain = Bergain.find_by_sql(
      <<-SQL
      SELECT COUNT(orders.id) AS total_bergain_approved FROM `orders`
        INNER JOIN bergains ON bergains.order_id = orders.id
      WHERE bergains.bergain_status = "Approved" AND orders.user_id = #{current_user.id}
      SQL
    )
  end

end
