class ContentsController < ApplicationController
  before_filter :init_page

  def show
    @content = Content.find_by_uri(params[:id]) || Content.find_by_title(params[:id])
		@title = @content.title if !@content.nil?
		if @content.nil?
      render :text => "Ошибка 404: страница не найдена", :status => 404
    end
	end

end