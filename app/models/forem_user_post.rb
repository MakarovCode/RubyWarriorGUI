class ForemUserPost < ApplicationRecord
  belongs_to :user
  belongs_to :forem_post
end
