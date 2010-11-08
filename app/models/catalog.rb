class Catalog < ActiveRecord::Base
  has_many :complects
  validates_presence_of :title
end
