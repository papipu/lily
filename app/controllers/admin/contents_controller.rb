class Admin::ContentsController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"
  
  def index
    @contents = Content.all
    @parents = {0=>'отсутствует'}
    @contents.each do |content|
      @parents[content.id]=content.title
    end
		@actions = [
			{:url=>url_for(:action=>'new'),:title=>'+ добавить страницу'}
		]
		@title = 'Список страниц'
	end

	def new
    @parents = [['отсутствует',0]]
    @contents = Content.all
    @contents.each do |content|
      @parents.push [content.title,content.id]
    end
		@content = Content.new
		@title = 'Добавить страницу'
	end

	def edit
    @parents = [['отсутствует',0]]
    @contents = Content.all
    @contents.each do |content|
      @parents.push [content.title,content.id]
    end
		@content = Content.find(params[:id])
		@title = 'Редактирование страницу'
	end

	def show
    @content = Content.find(params[:id])
		@title = 'Просмотр страницы '
	end

	def create
    @parents = [['отсутствует',0]]
    @contents = Content.all
    @contents.each do |content|
      @parents.push [content.title,content.id]
    end
		@content = Content.new(params[:content])
    @title = 'Добавить страницу'
		respond_to do |format|
  		if @content.save
    		flash[:notice] = "Страница добавлена"
    		format.html { redirect_to(:action=>'show',:id=>@content.id) }
 			else
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @parents = [['отсутствует',0]]
    @contents = Content.all
    @contents.each do |content|
      @parents.push [content.title,content.id]
    end
    @content = Content.find(params[:id])
		@title = 'Редактирование страницу'
		respond_to do |format|
			if @content.update_attributes(params[:content])
		  	flash[:notice] = 'Страница изменена'
		  	format.html { redirect_to(:action=>'show',:id=>@content.id) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @content = Content.find(params[:id])
    if @current_user.group=='2'
      flash[:notice] = 'Страница удалена'
      @content.destroy
    end
		respond_to do |format|
  		format.html { redirect_to(admin_contents_url) }
		end

	end
end