class Admin::TemplatesController < ApplicationController
  before_filter :init_admin_page
  layout "admin/admin"
  def index
    @templates = get_templates
    @title = 'Список шаблонов сайта'
  end

	def edit
    filename = get_template
    if request.post?
      @textfile = params[:textfile]
      result = open(File.dirname(__FILE__)+'/../../views/'+filename, 'w') do |f| f.puts @textfile end
      if result
		  	flash[:notice] = 'Шаблон обновлен'
      else
        flash[:notice] = 'Ошибка сохранения'
      end
    else
      @textfile = File.read(File.dirname(__FILE__)+'/../../views/'+filename)
    end
    @title = 'Редактирование шаблона: '+filename
	end

  def get_templates
    templates = []
    dirs = Dir.open(File.dirname(__FILE__)+'/../../views/')
    counter=1
    dirs.each do |dir|
      path = Pathname.new(File.dirname(__FILE__)+'/../../views/' + dir)
      if dir[0].chr!='.' && dir!='admin' && path.directory?
        files = Dir.open(File.dirname(__FILE__)+'/../../views/' + dir)
        files.each do |file|
          if file[0].chr!='.' && file!='admin'
            template = {:id=>counter,:title=>"#{dir}/#{file}"}
            templates.push template
            counter+=1
          end
        end
      end
    end
    templates
  end

  def get_template
    template = ''
    dirs = Dir.open(File.dirname(__FILE__)+'/../../views/')
    counter=1
    dirs.each do |dir|
      path = Pathname.new(File.dirname(__FILE__)+'/../../views/' + dir)
      if dir[0].chr!='.' && dir!='admin' && path.directory?
        files = Dir.open(File.dirname(__FILE__)+'/../../views/' + dir)
        files.each do |file|
          if file[0].chr!='.' && file!='admin'
            if counter==params[:id].to_i
              template = "#{dir}/#{file}"
            end
            counter+=1
          end
        end
      end
    end
    template
  end

end