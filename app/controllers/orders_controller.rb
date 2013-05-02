class OrdersController < ApplicationController
  before_filter :require_login

  def index
    @orders = Search.filter_user_orders(current_user.id, params)
  end

  def show
    # @order = current_user.orders.find params[:id]
    order = Order.find(params[:id])
    if current_user.id == order.user_id
      @order = Order.find(params[:id])
    else
      redirect_to account_orders_path
    end
  end

  def create
    @order = Order.create_and_charge(cart: current_cart,
                                     user: current_user,
                                     token: params[:stripeToken])
    if @order.valid?
      session[:cart] = current_cart.destroy
      Mailer.order_confirmation(current_user, @order).deliver
      redirect_to account_order_path(@order),
        :notice => "Order submitted!"
    else
      redirect_to cart_path, :notice => "Checkout failed."
    end
  end

  def buy_now
    @order = Order.create_and_charge(cart: Cart.new({params[:order] => '1'}),
                                     user: current_user,
                                     token: params[:stripeToken])
    if @order.valid?
      session[:cart] = current_cart.destroy
      Mailer.order_confirmation(current_user, @order).deliver
      redirect_to account_order_path(@order),
        :notice => "Order submitted!"
    else
      redirect_to :back, :notice => "Checkout failed."
    end
  end
end
