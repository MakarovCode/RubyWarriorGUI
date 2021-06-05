class RubyWarriorController < ApplicationController
  
  include RubyWarrior
  
  def index 
    
    @game = RubyWarrior::Game.new
    @game.start
    
    render status: 200, json: {message: "ok"}
  end

end
