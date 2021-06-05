module RubyWarrior
  module Abilities
    class Explode < Base
      attr_accessor :time
      
      def description
        "Kills you and all surrounding units. You probably don't want to do this intentionally."
      end
      
      def perform
        
        voice = []
        
        if @unit.position
            voice.push @unit.say("Explota, el techo colapsa y daña a todas las unidades.", "explode")
          @unit.position.floor.units.map do |unit|
            unit.take_damage(100)
          end
        end
        
        voice
      end
      
      def pass_turn
        if @time && @unit.position
          @unit.say "is ticking"
          @time -= 1
          perform if @time.zero?
        end
      end
    end
  end
end
