class Food < ActiveRecord::Base
	belongs_to :restaurant

  validates :name, :price, :image, presence: true
  do_not_validate_attachment_file_type :image

  has_attached_file :image, styles: { :large => "600x600#", :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
