require "hack_rb/vm_translator/parser"

module HackRB
  module VMTranslator
    def self.translate(input_stream, output_stream)
      parser = Parser.new(input_stream)

      parser.instructions.each do |instruction|
        output_stream.puts instruction.to_asm
      end
    end
  end
end
