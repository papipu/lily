class OrdersController < ApplicationController
  before_filter :init_page

  def new
    @order = Order.new
    @title = 'Оформление заказа'
  end

  def create
		@order = Order.new
		@title = 'Оформление заказа'
		respond_to do |format|
  		if @order.save
        Mailer.deliver_send(
          @current_user.email,"Ваш заказ принят"
        )
    		flash[:notice] = "Ваш заказ принят"
    		format.html { redirect_to(:controller=>'index') }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end
end
