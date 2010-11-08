class TrashController < ApplicationController
  before_filter :init_page
  
  def index
    @products = get_trash.items
		@title = 'Ваша корзина'
  end
  
end