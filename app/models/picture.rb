class Picture < ApplicationRecord
  validates :content, presence:true
  validates :postimage, presence:true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :postimage, ImageUploader
end
