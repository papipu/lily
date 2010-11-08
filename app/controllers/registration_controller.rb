class RegistrationController < ApplicationController
  before_filter :init_page
  
  def index
		@user = User.new
		@title = 'Регистрация на сайте'
  end

  def create
		@user = User.new(params[:user])
		@title = 'Регистрация на сайте'
		respond_to do |format|
			@user.password = Digest::MD5.hexdigest(@user.password)
      @user.group = 0
  		if @user.save
        Mailer.deliver_send(
          @user.email,"Вы зарегистрировались на сайте #{request.host}","info@#{request.host}"
        )
    		flash[:notice] = "Регистрация прошла успешно, вы можете войти на сайт"
    		format.html { redirect_to(:controller=>'index') }
 			else
        @user.password = ''
    		format.html { render :action => "index" }
  		end
		end
	end
end
