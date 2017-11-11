require "hack_rb/vm_translator/label"

module HackRB
  module VMTranslator
    module VirtualMachine
      class << self
        def current_class=(class_name)
          @current_class = class_name
          @label_count = 0
        end

        def current_class
          @current_class
        end

        def uniq_label
          @label_count = @label_count + 1
          yield Label.new(@current_class, @label_count)
        end

        def segment(segment_name)
          Segment.get(segment_name)
        end

        def execute(command)
          case command
          when /(push|pop) (\w+) (\d+)/
            Stack.public_send($1, segment($2), $3)
          when /(goto|if-goto) (\w+)/
            Label.public_send($1, $2)
          when /label (\w+)/
            Label.declare($1)
          end
        end
      end
    end
  end
end
