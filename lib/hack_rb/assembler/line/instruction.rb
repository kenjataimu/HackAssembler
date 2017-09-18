require "hack_rb/assembler/line/command"

module HackRB
  module Assembler
    class Instruction < Command
      def initialize(body)
        super
        clear_comment!
      end

      private

      def clear_comment!
        @body = /^(.+)(#{Comment.regexp})?$/.match(@body).to_a.first
      end
    end
  end
end
