module Rubywarrior
  module Api
    module V1
      class GameController < ApplicationController
    
        skip_before_action :verify_authenticity_token
    
        def run 
          
          puts "======>#{params[:code]}"
          
          @player = RubywarriorPlayer.find(params[:warrior_id])
          @level = RubywarriorTower.find(params[:level_id])
          
          path = Rails.root.join('data_for_levels', "#{@player.id}")
          
          File.truncate(path.to_s + "/L#{@level.id}_player.rb", 0)
          file = File.open(path.to_s + "/L#{@level.id}_player.rb", 'w')
              
          file.puts params[:code]
          file.close
          
          @game = RubyWarrior::Game.new
          result = @game.start(@player, @level)
          
          render status: 200, json: {message: "ok", game: result}
        end
    
      end
    end
  end
end
