module RubyWarrior
    module Units
        class Base
            attr_writer :health, :id
            attr_accessor :position

            def attack_power
                0
            end

            def max_health
                0
            end

            def earn_points(points)
            end

            def health
                @health ||= max_health
            end

            def take_damage(amount)
                unbind if bound?

                voice = nil

                if health
                    self.health -= amount
                    voice = say("Recibe <amount>#{amount}</amount> de daño, Le quedan <health>#{health}</health> de vida!", "damage")
                    if health <= 0
                        @position = nil
                        voice = say("dies", "dead")
                    end
                end
                voice
            end

            def alive?
                !position.nil?
            end

            def bound?
                @bound
            end

            def unbind
                voice = nil
                voice = say "Se libera de las ataduras", "unbind"
                @bound = false
                voice
            end

            def bind
                @bound = true
            end

            def say(msg, action)
                {id: @id, code: name, message: "#{name} #{msg}", action: action}
            end

            def name
                self.class.name.split('::').last.titleize
            end
            alias_method :to_s, :name

            def add_abilities(*new_abilities)
                new_abilities.each do |ability|
                    abilities[ability] = eval("Abilities::#{ability.to_s.sub('!', '').camelize}").new(self) # TODO use something similar to constantize here
                end
            end

            def next_turn
                Turn.new(abilities)
            end

            def prepare_turn
                @current_turn = next_turn
                play_turn(@current_turn)
            end

            def perform_turn

                voice =

                    if @position
                        abilities.values.each do |ability|
                            ability.pass_turn
                        end
                        if @current_turn.action && !bound?
                            name, *args = @current_turn.action
                            voice = abilities[name].perform(*args)
                        end
                    end

                voice
            end

            def play_turn(turn)
                # to be overriden by subclass
            end

            def abilities
                @abilities ||= {}
            end

            def character
                "?"
            end
        end
    end
end
