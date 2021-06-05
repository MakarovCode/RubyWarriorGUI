class Category < ApplicationRecord
  has_many :tutorials
  def self.in_menu
  	where(show_in_menu: true)
  end
end
