class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  has_many :images, dependent: :destroy
  

  has_attached_file :image, :styles => { :medium => "1000x420>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

 

  extend FriendlyId
  friendly_id :title, use: :slugged
end
