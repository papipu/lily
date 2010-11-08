class IndexController < ApplicationController
  before_filter :init_page

  def index
    @content = Content.find_by_title('Главная')
    @complects = Complect.find(:all, :conditions => ["on_main = 1"],:order => 'RAND()',:limit=>'0,4')
		if @content.nil?
      render :text => "Ошибка 404: страница не найдена", :status => 404
    end
  end
  
end