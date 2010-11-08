class Admin::UsersController < ApplicationController
	before_filter :init_admin_page
  layout "admin/admin"

  def index
		@users = User.all
		@actions = [
			{:url=>url_for(:action=>'new'),:title=>'+ добавить пользователя'}
		]
		@title = 'Список пользователей'
	end

	def new
		@user = User.new
    @groups = [['пользователи',0],['администраторы',1]]
    @groups.push ['разработчики',2] if @current_user.group=='2'
		@title = 'Добавить пользователя'
	end

	def edit
		@user = User.find(params[:id])
    @groups = [['пользователи',0],['администраторы',1]]
    @groups.push ['разработчики',2] if @current_user.group=='2'
		@title = 'Редактирование информации о пользователе'
	end

	def show
    @user = User.find(params[:id])
		@title = 'Информация о пользователе '+@user.login
	end

	def create
		@user = User.new(params[:user])
    @groups = [['пользователи',0],['администраторы',1]]
    @groups.push ['разработчики',2] if @current_user.group=='2'
		@title = 'Добавить пользователя'
		respond_to do |format|
			@user.password = Digest::MD5.hexdigest(@user.password)
  		if @user.save
        Mailer.deliver_send(
          @user.email,"Вы зарегистрировались на сайте #{request.host}","info@#{request.host}"
        )
    		flash[:notice] = "Пользователь добавлен"
    		format.html { redirect_to(:action=>'show',:id=>@user.id) }
 			else
        @user.password = ''
    		format.html { render :action => "new" }
  		end
		end
	end

	def update
    @user = User.find(params[:id])
    @groups = [['пользователи',0],['администраторы',1]]
    @groups.push ['разработчики',2] if @current_user.group=='2'
		@title = 'Редактирование информации о пользователе'
		respond_to do |format|
			if (@user.group!='2' || @current_user.group=='2') && @user.update_attributes(params[:user])
		  	flash[:notice] = 'Информация о пользователе изменена'
		  	format.html { redirect_to(:action=>'show',:id=>@user.id) }
			else
		  	format.html { render :action => "edit" }
			end
		end
	end

	def destroy
    @user = User.find(params[:id])
    if @user.group!='2' || @current_user.group=='2'
      flash[:notice] = 'Пользователь удален'
      @user.destroy
    end
    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
    end
	end

  def mail
    @users = User.all
    @title = 'Создать рассылку сообщений'
    if request.post?
      @users.each do |user|
        Mailer.deliver_send(user.email,params[:message])
      end
    end
  end

end