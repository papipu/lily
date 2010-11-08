class Product < ActiveRecord::Base
  belongs_to :complect
  validates_presence_of :title, :price
  named_scope :from_catalog,
    lambda {|catalog_id| {:joins=>:complect,:conditions => ['catalog_id = ?', catalog_id]}}
end