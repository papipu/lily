class ComplectsController < ApplicationController
  before_filter :init_page

  def show
    @complect = Complect.find(params[:id])
		@title = @complect.title if !@complect.nil?
    if @catalog.nil?
      render :text => "Ошибка 404: страница не найдена", :status => 404
    end
	end
  
end