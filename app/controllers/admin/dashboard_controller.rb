class Admin::DashboardController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"
  def index
    @title = 'Панель управления сайтом'
  end
end
