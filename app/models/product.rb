class Product < ActiveRecord::Base
  mount_uploader :image_url, ProductImageUploader

  validates :title, :description, :price, presence:true
  validates :price, :numericality => { :greater_than => 0 }
end
