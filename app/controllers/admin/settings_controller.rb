class Admin::SettingsController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"

  def index
    @settings = Setting.all
    if @current_user.group=='2'
      @actions = [{:url=>url_for(:action=>'new'),:title=>'+ добавить параметр'}]
    end
		@title = 'Настройки сайта'
	end

	def new
		@setting = Setting.new
		@title = 'Добавить параметр'
	end

	def edit
		@setting = Setting.find(params[:id])
		@title = 'Редактирование параметра'
	end

	def create
		@setting = Setting.new(params[:setting])
		@title = 'Добавить параметр'
		respond_to do |format|
  		if @setting.save
    		flash[:notice] = "Параметр добавлен"
    		format.html { redirect_to(admin_settings_url) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @setting = Setting.find(params[:id])
		@title = 'Редактирование параметра'
		respond_to do |format|
			if @setting.update_attributes(params[:setting])
		  	flash[:notice] = 'Параметр изменен'
		  	format.html { redirect_to(admin_settings_url) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
		respond_to do |format|
  		format.html { redirect_to(admin_settings_url) }
		end
	end
end
