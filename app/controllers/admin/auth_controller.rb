class Admin::AuthController < ApplicationController
  before_filter :admin_authorize, :except => :login
	def login
		session[:user_id] = nil
		if request.post?
			user = User.authenticate(params[:login],params[:password])
			if user
				session[:user_id]=user.id
        flash[:notice] = 'добро пожаловать в панель управления'
				redirect_to(:controller=>'dashboard')
			else
				flash[:notice] = 'имя пользователя или пароль неверны'
			end
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to(:controller => 'auth',:action=>'login')
	end
end