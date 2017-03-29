class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :likes , class_name: "User"
  mount_uploader :image, ImageUploader

end
