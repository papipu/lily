class LoginController < ApplicationController
  def index
		session[:user_id] = nil
		if request.post?
			user = User.authenticate(params[:login],params[:password])
			if user
				session[:user_id]=user.id
        flash[:notice] = 'Добро пожаловать на сайт'
				redirect_to('/')
			else
				flash[:notice] = 'Имя пользователя или пароль неверны'
        redirect_to('/')
			end
		end
	end

  def logout
		session[:user_id] = nil
		redirect_to('/')
	end
end
