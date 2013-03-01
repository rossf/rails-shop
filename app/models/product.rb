class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :product_image, :product_image_cache

  mount_uploader :product_image, ProductImageUploader
end
