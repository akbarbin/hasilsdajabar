class Buyer::PaymentsController < ApplicationController
  before_filter :authenticate_user!
  layout "buyer"

  def confirm_payment
    @payment = Payment.new
  end

  def save_confirm_payment
    @payment = Payment.new(params[:payment])
    respond_to do |format|
      if @payment.save
        format.html { redirect_to buyer_dashboards_url, notice: 'Konfirmasi payment berhasil.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "confirm_payment" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
end
