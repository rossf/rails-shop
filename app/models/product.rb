class Product < ActiveRecord::Base
  has_many :cart_items
  attr_accessible :description, :name, :price, :product_image, :product_image_cache

  mount_uploader :product_image, ProductImageUploader
end
