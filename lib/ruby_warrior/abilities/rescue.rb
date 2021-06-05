module RubyWarrior
  module Abilities
    class Rescue < Base
      def description
        "Rescue a captive from his chains (earning 20 points) in given direction (forward by default)."
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        
        voice = []
        
        if space(direction).captive?
          recipient = unit(direction)
            voice.push @unit.say("Rescata en la direccion #{direction} al #{recipient}", "rescue-#{direction}")
          voice.push recipient.unbind
          if recipient.kind_of? Units::Captive
            recipient.position = nil
            @unit.earn_points(20)
          end
        else
            voice.push @unit.say("Rescata en la direccion #{direction} y no habia nadie", "rescuefail")
        end
        
        voice
      end
    end
  end
end
