module RubyWarrior
    module Abilities
        class Walk < Base
            def description
                "Move in the given direction (forward by default)."
            end

            def perform(direction = :forward)
                verify_direction(direction)

                voice = []

                if @unit.position
                    voice.push @unit.say("Camina en la direccion #{direction}", "walk-#{direction}")
                    if space(direction).empty?
                        @unit.position.move(*offset(direction))
                    else
                        voice.push @unit.say("Se tropieza con #{space(direction)}", "walkfail")
                end
            end

            voice
        end
    end
end
end
