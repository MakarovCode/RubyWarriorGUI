module RubyWarrior
    module Abilities
        class Bind < Base
            def description
                "Binds a unit in given direction to keep him from moving (forward by default)."
            end

            def perform(direction = :forward)
                verify_direction(direction)
                receiver = unit(direction)

                voice = []

                if receiver
                    voice.push @unit.say("Atrapa en #{direction} y restrinje a #{receiver}", "bind-#{direction}")
                    receiver.bind
                else
                    voice.push @unit.say("Atrapa en #{direction} y no restrinje a nadie", "bind-#{direction}")
                end

                voice

            end
        end
    end
end
