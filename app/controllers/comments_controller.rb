class CommentsController < ApplicationController
  before_filter :init_page
  
  def index
    @comments = Comment.all(:conditions=>['comment_type = ?','comment'])
    @comment = Comment.new()
    @title = 'Книга отзывов'
  end

  def create
		@comment = Comment.new(params[:comment])
    @wish.comment_type = 'comment'
		@title = 'Книга отзывов'
		respond_to do |format|
  		if @comment.save
    		flash[:notice] = "Ваш отзыв добавлен"
    		format.html { redirect_to(:action=>'index') }
 			else
    		format.html { render :action => "index" }
  		end
		end
	end
end
