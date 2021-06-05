module RubyWarrior
  module Abilities
    class Rest < Base
      def description
        "Gain 10% of max health back, but do nothing more."
      end
      
      def perform
        
        voice = []
        
        if @unit.health < @unit.max_health
          amount = (@unit.max_health*0.1).round
          amount = @unit.max_health-@unit.health if (@unit.health + amount) > @unit.max_health
          @unit.health += amount
          voice.push @unit.say("receives #{amount} health from resting, up to #{@unit.health} health", "rest")
        else
          voice.push @unit.say("is already fit as a fiddle", "restfull")
        end
        
        voice
      end
    end
  end
end
