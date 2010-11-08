class Admin::ComplectsController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"

	def new
		@complect = Complect.new
    @catalogs = Catalog.all
    @complect_catalogs = [['отсутствует',0]]
    @catalogs.each do |catalog|
      @complect_catalogs.push [catalog.title, catalog.id]
    end
    @catalog_id = params[:catalog]
		@title = 'Добавить комплект'
    if @catalog_id
      @actions = [{:url=>url_for(:controller=>'catalogs',:action=>'show',:id=>@catalog_id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
	end

	def edit
		@complect = Complect.find(params[:id])
    @catalogs = Catalog.all
    @complect_catalogs = [['отсутствует',0]]
    @catalogs.each do |catalog|
      @complect_catalogs.push [catalog.title, catalog.id]
    end
		@title = 'Редактирование комплекта'
    @actions = [
			{:url=>url_for(:controller=>'catalogs',:action=>'show',:id=>@complect.catalog.id),:title=>'← назад'}
		]
	end

	def show
    @complect = Complect.find(params[:id])
		@title = 'Просмотр комплекта '
    @actions = [
			{:url=>url_for(
          :controller=>'products',:action=>'new',:complect=>@complect.id,:catalog=>@complect.catalog.id
        ),:title=>'+ добавить товар'},
      {:url=>url_for(:controller=>'photos',:action=>'new',:complect=>@complect.id),:title=>'+ добавить фотографию'},
      {:url=>url_for(edit_admin_complect_path(@complect)),:title=>'# изменить комплект'},
      {:url=>url_for(:controller=>'catalogs',:action=>'show',:id=>@complect.catalog.id),:title=>'← назад'}
		]
	end

	def create
		@complect = Complect.new(params[:complect])
    @catalogs = Catalog.all
    @complect_catalogs = [['отсутствует',0]]
    @catalogs.each do |catalog|
      @complect_catalogs.push [catalog.title, catalog.id]
    end
    @catalog_id = params[:catalog]
		@title = 'Добавить комплект'
    @actions = [
			{:url=>url_for(:controller=>'catalogs',:action=>'show',:id=>@catalog_id),:title=>'← назад'}
		]
		respond_to do |format|
  		if @complect.save
    		flash[:notice] = "Комплект добавлен"
    		format.html { redirect_to(:action=>'show',:id=>@complect.id) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @complect = Complect.find(params[:id])
    @catalogs = Catalog.all
    @complect_catalogs = [['отсутствует',0]]
    @catalogs.each do |catalog|
      @complect_catalogs.push [catalog.title, catalog.id]
    end
		@title = 'Редактирование комплекта'
    @actions = [
			{:url=>url_for(:controller=>'catalogs',:action=>'show',:id=>@complect.catalog.id),:title=>'← назад'}
		]
		respond_to do |format|
			if @complect.update_attributes(params[:complect])
		  	flash[:notice] = 'Комплект изменен'
		  	format.html { redirect_to(:action=>'show',:id=>@complect.id) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @complect = Complect.find(params[:id])
    @complect.photos.each { |photo| photo.destroy}
    catalog_id = @complect.catalog.id
    @complect.destroy
		respond_to do |format|
  		format.html { redirect_to(:controller=>'catalogs',:action=>'show',:id=>catalog_id) }
		end
	end
end
