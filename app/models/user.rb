class User < ActiveRecord::Base
  has_many :tasks
  
  has_secure_password validations: false
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :email, presence: true
  
  before_save :generate_slug!
  
  def to_param
    self.slug
  end
  
   def generate_slug!
     self.slug = to_slug(self.name)
  end
  
  def to_slug(name)
    str = name.strip
    str. gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/, "-"
    str.downcase
  end
end