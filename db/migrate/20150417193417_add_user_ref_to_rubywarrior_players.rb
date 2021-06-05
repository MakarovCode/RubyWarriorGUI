class AddUserRefToRubywarriorPlayers < ActiveRecord::Migration[6.1]
  def change
    add_reference :rubywarrior_players, :user, index: true
    add_foreign_key :rubywarrior_players, :users
  end
end
