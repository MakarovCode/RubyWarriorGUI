class Tutorial < ApplicationRecord
  
  has_many :pages
  has_many :category_tutorials
  has_many :categories, through: :category_tutorials
  
  has_many :tutorial_comments
  
  belongs_to :category
  
  accepts_nested_attributes_for :category_tutorials, allow_destroy: true
  
end
