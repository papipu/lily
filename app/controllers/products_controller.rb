class ProductsController < ApplicationController
  before_filter :init_page

  def show
    @product = Product.find(params[:id])
		@title = 'Просмотр товара '
	end

  def trash
    if @current_user
      product = Product.find(params[:id])
      @trash = get_trash
      @trash.add_product(product)
      message = product.title+' добавлен в корзину'
    else
      message = 'вы должны войти на сайт'
    end
    respond_to do |format|
      format.js { render :text=>message}
    end
  end
  
end
