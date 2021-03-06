class Status < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  
  validates :status, presence: true, length: {minimum:  3}
    
  before_create :generate_slug!
  
  def to_param
    self.slug
  end
  
   def generate_slug!
    self.slug = to_slug(self.status)
    self.slug= 'new1' if self.slug == 'new' 
  end
  
  def to_slug(name)
    str = name.strip
    str. gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/, "-"
    str.downcase
  end
end