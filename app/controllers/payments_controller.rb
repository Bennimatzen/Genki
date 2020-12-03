class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @pharmacy = Pharmacy.find(@order.pharmacy_id)
    @prescription = Prescription.find(@order.prescription_id)
  end
end
