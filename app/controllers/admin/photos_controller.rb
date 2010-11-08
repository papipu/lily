class Admin::PhotosController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"

	def new
		@photo = Photo.new
    @complect = Complect.find(params[:complect])
    @actions = [{:url=>admin_photo_path(@complect),:title=>'← назад'}]
		@title = 'Добавить фотографию'
    if @complect
      @actions = [{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect.id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
	end

	def edit
		@photo = Photo.find(params[:id])
    @complect = Complect.find(params[:complect])
    if @complect
      @actions = [{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect.id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
		@title = 'Редактирование фотографии'
	end

	def show
    @photos = Photo.find(:all, :conditions => ["complect_id = ?", params[:id]])
    @complect = Complect.find(params[:id])
    @actions = [
      {:url=>url_for(:action=>'new',:complect=>@complect.id),:title=>'+ добавить фотографию'},
      {:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect.id),:title=>'← назад'}
      ]
		@title = 'Просмотр фотографий комплекта '
	end

	def create
		@photo = Photo.new(params[:photo])
    @complect = Complect.find(params[:complect])
    @photo.complect_id = @complect.id
    if @complect
      @actions = [{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect.id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
		@title = 'Добавить фотографию'
		respond_to do |format|
  		if @photo.save
    		flash[:notice] = "Фотография добавлена"
    		format.html { redirect_to(:action=>'show',:id=>@complect) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @photo = Photo.find(params[:id])
    @complect = Complect.find(params[:complect])
    if @complect
      @actions = [{:url=>url_for(:controller=>'complects',:action=>'show',:id=>@complect.id),:title=>'← назад'}]
    else
      @actions = [{:url=>url_for(admin_catalogs_path),:title=>'← назад'}]
    end
		@title = 'Редактирование фотографии'
		respond_to do |format|
			if @photo.update_attributes(params[:photo])
		  	flash[:notice] = 'Фотография изменена'
		  	format.html { redirect_to(:action=>'show',:id=>@complect) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @photo = Photo.find(params[:id])
    complect_id = @photo.complect_id
    @photo.destroy
		respond_to do |format|
  		format.html { redirect_to(:action=>'show',:id=>complect_id) }
		end
	end
end