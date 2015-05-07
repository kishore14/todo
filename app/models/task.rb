class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  
  validates :title, presence: true,  length: {minimum:  3}
  validates :actions, presence: true
  
  before_save :generate_slug
  
  def to_param
    self.slug
  end
  
  def generate_slug
    to_slug(self.title)
  end
  
  def to_slug(name)
    str = name.strip
    str. gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/, "-"
    str.downcase
  end
end