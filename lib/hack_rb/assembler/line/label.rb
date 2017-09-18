require "hack_rb/assembler/line/command"

module HackRB
  module Assembler
    class Label < Command
      def self.regexp
        /\(\S+\)/
      end

      def name
        @name ||= body[1..-2]
      end
    end
  end
end
