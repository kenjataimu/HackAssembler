$LOAD_PATH.unshift File.dirname(__FILE__)

require "hack_assembler/parser"

module HackAssembler
  def self.assembly(input_stream, output_stream)
    parser = Parser.new(input_stream)

    parser.instructions.each do |instruction|
      output_stream.puts instruction.to_binary
    end
  end
end
