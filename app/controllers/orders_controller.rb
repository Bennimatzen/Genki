class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    prescription = Prescription.find(params[:order][:prescription_id])
    pharmacy = Pharmacy.find(params[:order][:pharmacy_id])
    order = Order.create!(prescription: prescription, prescription_sku: prescription.sku, amount: prescription.price, state: 'pending', user: current_user, pharmacy: pharmacy)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: prescription.sku,
        amount: prescription.price_cents,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
