class Product < ActiveRecord::Base
  has_many :line_items
  default_scope :order => 'title'
  before_destroy :ensure_not_referenced_by_line_item
  def ensure_not_referenced_by_line_item
    if line_items.count.zero?
      return true
    else  
      errors[:base] << "line Item present"
      return false
    end
  end
  #validate :title, :description, :image_url, :presence => true
  validates_presence_of :title ,:description ,:image_url , :message => "can't be blank"
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, :message => "is not a number!"
  validates_uniqueness_of :title, :message => "must be unique!"  
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "is invalid format"
  validates_length_of :title, :minimum => 10, :message => "must be more then 10 caracters"
end
