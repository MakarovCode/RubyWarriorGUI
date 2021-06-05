module RubyWarrior
    module Abilities
        class Form < Base
            def description
                "Forms a golem in given direction taking half of invoker's health. The passed block is executed for each golem turn."
            end

            def perform(direction = :forward, &block)
                verify_direction(direction)

                voice = []

                if space(direction).empty?
                    x, y = @unit.position.translate_offset(*offset(direction))
                    health = (@unit.health/2.0).floor
                    golem = @unit.base_golem
                    golem.max_health = health
                    golem.turn = block
                    @unit.health -= health
                    @unit.position.floor.add(golem, x, y, @unit.position.direction)
                    voice.push @unit.say("Forma un golem #{direction} y entrega la mitad de su vida (#{health})", "form-#{direction}")
                else
                    voice.push @unit.say("Falla en formar un Golem porque hay algo que se interpone en el camino.", "form-fail")
                end

                voice
            end
        end
    end
end
