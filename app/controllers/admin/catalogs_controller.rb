class Admin::CatalogsController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"
  def index
    @catalogs = Catalog.all
		@actions = [
      {:url=>url_for(new_admin_catalog_path),:title=>'+ добавить каталог'}
		]
		@title = 'Список каталогов'
	end

	def new
		@catalog = Catalog.new
		@title = 'Добавить каталог'
	end

	def edit
		@catalog = Catalog.find(params[:id])
		@title = 'Редактирование каталог'
	end

  def show
    @catalog = Catalog.find(params[:id])
		@title = 'Просмотр каталога'
    @actions = [
			{:url=>url_for(:controller=>'complects',:action=>'new',:catalog=>@catalog.id),:title=>'+ добавить комплект'},
      {:url=>url_for(edit_admin_catalog_path(@catalog)),:title=>'# изменить каталог'},
      {:url=>url_for(:action=>'index'),:title=>'← назад'}
		]
	end

	def create
		@catalog = Catalog.new(params[:catalog])
		@title = 'Добавить каталог'
		respond_to do |format|
  		if @catalog.save
    		flash[:notice] = "Каталог добавлен"
    		format.html { redirect_to(admin_catalogs_url) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @catalog = Catalog.find(params[:id])
		@title = 'Редактирование каталога'
		respond_to do |format|
			if @catalog.update_attributes(params[:catalog])
		  	flash[:notice] = 'Каталог изменен'
		  	format.html { redirect_to(admin_catalogs_url) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
		respond_to do |format|
  		format.html { redirect_to(admin_catalogs_url) }
		end
	end
end
