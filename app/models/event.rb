class Event < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
  validates_attachment :image
  #validates_attachment_size :less_than => 5.megabytes
  
  # Validate content type
#  validates_attachment_content_type :image, :content_type => /\Aimage/
  # Validate filename
#  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :image
  
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" }
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end