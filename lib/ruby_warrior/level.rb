module RubyWarrior
  class Level
    attr_reader :profile, :number
    attr_accessor :description, :tip, :clue, :warrior, :floor, :time_bonus, :ace_score
    
    def self.grade_letter(percent)
      if    percent >= 1.0 then "S"
      elsif percent >= 0.9 then "A"
      elsif percent >= 0.8 then "B"
      elsif percent >= 0.7 then "C"
      elsif percent >= 0.6 then "D"
      else                      "F"
      end
    end
    
    def initialize(profile, number)
      @profile = profile
      @number = number
      @time_bonus = 0
    end
    
    def player_path
      @profile.player_path
    end
    
    def load_path
      File.join(
        File.expand_path('../../../towers/', __FILE__),
        File.basename(@profile.tower_path) + "/level_" +
          @number.to_s.rjust(3, '0') + ".rb"
      )
    end
    
    #def load_level
    def load_level(level)
      #LevelLoader.new(self).instance_eval(File.read(load_path))
      LevelLoader.new(self, level)
    end
    
    def load_player
      $: << player_path
      load 'player.rb'
    end
    
    def generate_player_files
      load_level
      PlayerGenerator.new(self).generate
    end
    
    #def play(turns = 1000)
    def play(level, turns = 1000)
      puts "======>LEVEL, play load level start"
      load_level(level)
      puts "======>LEVEL, play load level end"
      puts "======>LEVEL, play turn iterations"
      
      turn_desc = []
      
      turns.times do |n|
        if passed? || failed? 
          return turn_desc
        end
        
        puts "======>LEVEL, TURN #{n}"
        puts "#{@floor.character}"
        #UI.puts "- turn #{n+1} -"
        #UI.print @floor.character
        
        voices = []
        
        @floor.units.each { |unit| unit.prepare_turn }
        @floor.units.each { |unit| 
          voice = unit.perform_turn
          unless voice.nil?
            voices += voice
          end 
        }
        yield if block_given?
        @time_bonus -= 1 if @time_bonus > 0
        puts "=========>#{voices.to_json}"
        turn_desc.push({turn: n, description: @floor.character, voices: voices})
      end
      
    end
    
    def tally_points
      score = 0
      
      UI.puts "Level Score: #{warrior.score}"
      score += warrior.score
      
      UI.puts "Time Bonus: #{time_bonus}"
      score += @time_bonus
      
      if floor.other_units.empty?
        UI.puts "Clear Bonus: #{clear_bonus}"
        score += clear_bonus
      end
      
      if @profile.epic?
        UI.puts "Level Grade: #{grade_for(score)}" if grade_for(score)
        UI.puts "Total Score: " + score_calculation(@profile.current_epic_score, score)
        @profile.current_epic_grades[@number] = (score / ace_score.to_f) if ace_score
        @profile.current_epic_score += score
      else
        UI.puts "Total Score: " + score_calculation(@profile.score, score)
        @profile.score += score
        @profile.abilities = warrior.abilities.keys
      end
    end
    
    def grade_for(score)
      if ace_score
        self.class.grade_letter(score / ace_score.to_f)
      end
    end
    
    def clear_bonus
      ((warrior.score + time_bonus)*0.2).round
    end
    
    def score_calculation(current_score, addition)
      if current_score.zero?
        addition.to_s
      else
        "#{current_score} + #{addition} = #{current_score + addition}"
      end
    end
    
    def passed?
      #puts "==========>LEVEL, passed? evaluated #{@floor} - #{@floor.stairs_space.warrior?}"
      if @floor.nil?
        return true
      end
      @floor.stairs_space.warrior?
    end
    
    def failed?
      #puts "==========>LEVEL, failed? evaluated #{@floor} - #{!@floor.units.include?(warrior)}"
      if @floor.nil?
        return true
      end
      !@floor.units.include?(warrior)
    end
    
    def exists?
      File.exist? load_path
    end
    
    def setup_warrior(warrior)
      @warrior = warrior
      #@warrior.add_abilities(*profile.abilities)
      @warrior.name = @profile.name
    end
  end
end
