require "hack_rb/vm_translator/label"

module HackRB
  module VMTranslator
    module VirtualMachine
      class << self
        def class_name=(class_name)
          @class_name = class_name
          @label_count = 0
        end

        def uniq_label
          @label_count = @label_count + 1
          yield Label.new(@class_name, @label_count)
        end

        def segment(segment_name)
          Segment.get(segment_name)
        end

        def execute(command)
          case command
          when /(push|pop) (\w+) (\d+)/
            Stack.public_send($1, segment($2), $3) 
          end
        end
      end
    end
  end
end
