module RubyWarrior
  module Abilities
    class Pivot < Base
      ROTATION_DIRECTIONS = [:forward, :right, :backward, :left]
      
      def description
        "Rotate :left, :right or :backward (default)"
      end
      
      def perform(direction = :backward)
        verify_direction(direction)
        
        voice = []
        
        @unit.position.rotate(ROTATION_DIRECTIONS.index(direction))
        voice.push @unit.say("pivots #{direction}", "pivot-#{direction}")
        voice
      end
    end
  end
end
