class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :forem_user_post
    has_many :rubywarrior_players

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

    validates :username, uniqueness: :true

    before_create :give_username

    def forem_name
        username
    end

    def forem_email
        email
    end

    def give_username
        username = email
    end

    def accept_user
        update_column(:forem_state, "approved")
    end

end
