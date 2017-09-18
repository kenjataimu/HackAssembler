require "hack_rb/assembler/parser"

module HackRB
  module Assembler
    def self.assembly(input_stream, output_stream)
      parser = Parser.new(input_stream)

      parser.instructions.each do |instruction|
        output_stream.puts instruction.to_binary
      end
    end
  end
end
