class Product < ActiveRecord::Base
  #validate :title, :description, :image_url, :presence => true
  validates_presence_of :title ,:description ,:image_url , :message => "can't be blank"
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, :message => "is not a number!"
  validates_uniqueness_of :title, :message => "must be unique!"  
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "is invalid format"
end
