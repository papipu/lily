class Admin::ProductsController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"

	def new
		@product = Product.new
    @complect_id = params[:complect]
    @catalog_id = params[:catalog]
    if @catalog_id
      @complects = Complect.find(:all, :conditions => ["catalog_id = ?", @catalog_id])
    else
      @complects = Complect.all
    end
    @product_complects = [['отсутствует',0]]
    @complects.each do |complect|
      @product_complects.push [complect.title, complect.id]
    end
    if @complect_id
      @actions = [{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect_id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
		@title = 'Добавить товар'
	end

	def edit
		@product = Product.find(params[:id])
    @complects = Complect.find(:all, :conditions => ["catalog_id = ?", @product.complect.catalog.id])
    @product_complects = [['отсутствует',0]]
    @complects.each do |complect|
      @product_complects.push [complect.title, complect.id]
    end
    @actions = [
			{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@product.complect.id),:title=>'← назад'}
		]
		@title = 'Редактирование товар'
	end

	def show
    @product = Product.find(params[:id])
    # Настройка страницы
    @actions = [
			{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@product.complect.id),:title=>'← назад'}
		]
		@title = 'Просмотр товара '
	end

	def create
		@product = Product.new(params[:product])
    @complect_id = params[:complect]
    @catalog_id = params[:catalog]
    if @catalog_id
      @complects = Complect.find(:all, :conditions => ["catalog_id = ?", @catalog_id])
    else
      @complects = Complect.all
    end
    @product_complects = [['отсутствует',0]]
    @complects.each do |complect|
      @product_complects.push [complect.title, complect.id]
    end
    @actions = [
			{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect_id),:title=>'← назад'}
		]
		@title = 'Добавить товар'
		respond_to do |format|
  		if @product.save
    		flash[:notice] = "Товар добавлен"
    		format.html { redirect_to(:controller=>'complects',:action=>'show',:id=>@product.complect_id) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @product = Product.find(params[:id])
    @complects = Complect.find(:all, :conditions => ["catalog_id = ?", @product.complect.catalog.id])
    @product_complects = [['отсутствует',0]]
    @complects.each do |complect|
      @product_complects.push [complect.title, complect.id]
    end
    @actions = [
			{:url=>url_for(admin_complects_path),:title=>'← назад'}
		]
		@title = 'Редактирование товар'
		respond_to do |format|
			if @product.update_attributes(params[:product])
		  	flash[:notice] = 'Товар изменен'
		  	format.html { redirect_to(:controller=>'complects',:action=>'show',:id=>@product.complect_id) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @product = Product.find(params[:id])
    complect_id = @product.complect_id
    @product.destroy
		respond_to do |format|
  		format.html { redirect_to(:controller=>'complects',:action=>'show',:id=>complect_id) }
		end
	end
end