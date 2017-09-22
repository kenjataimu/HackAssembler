require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class Parser
      def initialize(stream)
        @stream = stream
      end

      def instructions
        @instructions ||= Enumerator.new do |enum|
          while vm_line = @stream.gets
            yield Line.parse(vm_line.chomp)
          end
        end
      end
    end
  end
end
