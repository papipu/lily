class Photo < ActiveRecord::Base
  belongs_to :complect
  has_attached_file :image,
    :styles => {
    :big => "1200x1200>",
    :medium => "320x320>",
    :small => "148x148>"
  }
end