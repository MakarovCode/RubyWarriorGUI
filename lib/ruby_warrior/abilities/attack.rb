module RubyWarrior
    module Abilities
        class Attack < Base
            def description
                "Attacks a unit in given direction (forward by default)."
            end

            def perform(direction = :forward)
                verify_direction(direction)
                receiver = unit(direction)

                voice = []

                if receiver
                    voice.push @unit.say("Ataca en direccion #{direction} y le pega al #{receiver}", "attack-#{direction}")
                    if direction == :backward
                        power = (@unit.attack_power/2.0).ceil
                    else
                        power = @unit.attack_power
                    end
                    voice.push damage(receiver, power)
                else
                    voice.push @unit.say("Ataca en direccion #{direction} y no le pega a nada", "attack-#{direction}")
                end
                voice
            end
        end
    end
end
