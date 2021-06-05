module RubyWarrior
    module Abilities
        class Shoot < Base
            def description
                "Shoot your bow & arrow in given direction (forward by default)."
            end

            def perform(direction = :forward)
                verify_direction(direction)

                voice = []

                receiver = multi_unit(direction, 1..3).compact.first
                if receiver
                    voice.push @unit.say("Dispara en la direccion #{direction} y le pega a #{receiver}", "shoot-#{direction}")
                    voice.push damage(receiver, @unit.shoot_power)
                else
                    voice.push @unit.say("Dispara y no le pega a nada", "shootfail")
                end

                voice

            end

            def multi_unit(direction, range)
                range.map { |n| unit(direction, n) }
            end
        end
    end
end
