class Content < ActiveRecord::Base
  validates_presence_of :title
  typograf :text, :use_br => false
end