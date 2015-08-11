class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :foods, dependent: :destroy
	has_many :drinks, dependent: :destroy

	accepts_nested_attributes_for :foods,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :drinks,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true

  validates :name, :address, :category, :lat, :lng, :image, presence: true

	has_attached_file :image, styles: { :large => "600x600#", :medium => "300x300#", :thumb => "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
