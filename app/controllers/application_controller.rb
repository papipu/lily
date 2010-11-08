class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

	def admin_authorize
		@current_user = User.find_by_id(session[:user_id])
		unless @current_user && (@current_user.group=='1' || @current_user.group=='2')
			flash[:notice] = "Вы должны авторизоваться"
      redirect_to(:controller => 'auth',:action=>'login')
		end
	end

  def authorize
		@current_user = User.find_by_id(session[:user_id])
		unless @current_user
			flash[:notice] = "Вы должны авторизоваться"
      redirect_to(:controller => 'auth',:action=>'login')
		end
	end

  def init_admin_page
    admin_authorize
		if params[:action]!='index'
      @actions = [{:url=>url_for(:action=>'index'),:title=>'← назад'}]
    end
	end

  def init_page
    @main_menu = [
      {:url=>"/",:title=>'Главная'},
      {:url=>"/#1",:title=>'Заказ'},
      {:url=>"/contents/payment",:title=>'Оплата'},
      {:url=>"/contents/delivery",:title=>'Доставка'},
      {:url=>"/contents/wholesalers",:title=>'Оптовым покупателям'},
      {:url=>"/contents/corporate",:title=>'Корпоративные заказы'},
      {:url=>"/contents/individual",:title=>'Индивидуальные заказы'},
      {:url=>"/trash/",:title=>'Ваша корзина'}
    ]
    @second_menu = [
      {:url=>"/contents/about",:title=>'О компании'},
      {:url=>"/#1",:title=>'Новости'},
      {:url=>"/wishes",:title=>'Ваши пожелания'},
      {:url=>"/comments",:title=>'Книга отзывов'},
      {:url=>"/#4",:title=>'Задать вопрос'},
      {:url=>"/contents/instruction",:title=>'Инструкция по уходу'},
      {:url=>"/contents/contact",:title=>'Контакты'},
    ]
    @settings = {}
    settings = Setting.all
    settings.each do |setting|
      @settings[setting.name] = setting.value
    end
    @current_user = User.find_by_id(session[:user_id])
    @trash = get_trash
	end

  def get_trash
    session[:trash]||=Trash.new
  end

end
