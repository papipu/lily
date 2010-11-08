class WishesController < ApplicationController
  before_filter :init_page
  
  def index
    @wishes = Comment.all(:conditions=>['comment_type = ?','wish'])
    @wish = Comment.new()
    @title = 'Ваши пожелания'
  end

  def create
		@wish = Comment.new(params[:comment])
    @wish.comment_type = 'wish'
		@title = 'Ваши пожелания'
		respond_to do |format|
  		if @wish.save
    		flash[:notice] = "Ваше пожелание добавлено"
    		format.html { redirect_to(:action=>'index') }
 			else
    		format.html { render :action => "index" }
  		end
		end
	end
  
end