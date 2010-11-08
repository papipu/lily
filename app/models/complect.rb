class Complect < ActiveRecord::Base
  belongs_to :catalog
  has_many :products
  has_many :photos
  validates_presence_of :title
  typograf :description, :use_br => false
  has_attached_file :image,
    :styles => {
    :big => "1200x1200>",
    :medium => "320x320>",
    :small => "148x148>"
  }
end