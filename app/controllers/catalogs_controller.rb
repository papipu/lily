class CatalogsController < ApplicationController
  before_filter :init_page
  
  def show
    @catalog = Catalog.find_by_title(params[:id])
		unless @catalog.nil?
      @products = Product.from_catalog @catalog.id
      @title = @catalog.title if !@catalog.nil?
    else
      render :text => "Ошибка 404: страница не найдена", :status => 404
    end
	end
end