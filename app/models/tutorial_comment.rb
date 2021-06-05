class TutorialComment < ApplicationRecord
  belongs_to :user
  belongs_to :tutorial
  
  validates :user_id, presence: true
  validates :tutorial_id, presence: true
  validates :description, presence: true

  belongs_to :critic, class_name: "User", :foreign_key => 'critic_id'
end
