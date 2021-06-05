class CategoryTutorial < ApplicationRecord
  belongs_to :category
  belongs_to :tutorial
end
