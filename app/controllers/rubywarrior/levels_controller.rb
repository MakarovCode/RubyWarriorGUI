module Rubywarrior
    class LevelsController < ApplicationController
        layout "warrior"
        before_action :get_warrior

        def get_warrior 
            @warrior = RubywarriorPlayer.find(params[:warrior_id])
        end

        def index 
            @levels = RubywarriorTower.all
        end


        before_action :show    
        def show  

            @level = RubywarriorTower.find(params[:id])
            @next_level = RubywarriorTower.find_by_id(params[:id].to_i + 1)
            @game_warrior = @level.rubywarrior_tower_warrior                  
            data_for_level = @warrior.data_for_level(@level.id)                        
            @percent_for_space_x = 50/@level.size_width
            @percent_for_space_y = 50/@level.size_height

            if data_for_level.nil?
                #CREAR ARCHIVO
                path = Rails.root.join('data_for_levels', "#{@warrior.id}")         
                templates_path = Rails.root.join('lib', 'ruby_warrior', 'templates')       

                FileUtils.mkdir_p(path.to_s) unless File.exists? path.to_s
                FileUtils.cp(templates_path.to_s + '/player.rb', path.to_s)
                FileUtils.mv(path.to_s + '/player.rb', path.to_s + "/L#{@level.id}_player.rb")

                RubywarriorPlayerTower.create(rubywarrior_tower_id: @level.id, rubywarrior_player_id: @warrior.id, file_path: "/#{@warrior.id}/L#{@level.id}_player.rb")
            end

            path = Rails.root.join('data_for_levels', "#{@warrior.id}")
            @file_data = IO.binread(path.to_s + "/L#{@level.id}_player.rb")
            session[:data_for_level] =  data_for_level;


            if (!data_for_level.nil? && data_for_level.rubywarrior_tower_id >=1 ) && !user_signed_in? 
                session[:actual_url] = request.original_url
            end

            if user_signed_in? && session[:data_for_level] 
                datas = session[:data_for_level].rubywarrior_player_id

                warrior_user = RubywarriorPlayer.find_by(id: datas)

                if warrior_user.user_id == "" || warrior_user.user_id == nil
                    warrior_user.update(user_id: current_user.id)         
                elsif warrior_user.user_id != current_user.id
                    redirect_to rubywarrior_warriors_path, notice: "Warrior no válido"       
                end
            end
        end    
    end
end
