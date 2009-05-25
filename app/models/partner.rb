class Partner < ActiveRecord::Base
  has_attachment :content_type => :image, 
    :storage => :file_system, 
    :min_size => 0,
    :max_size => 500.kilobytes,
    :processor => :Rmagick 
  validates_as_attachment
end
