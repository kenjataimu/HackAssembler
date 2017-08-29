$LOAD_PATH.unshift File.dirname(__FILE__)

require "hack_assembler/parser"

module HackAssembler
  def self.assembly
    Parser.new(STDIN).instructions.each do |instruction|
      STDOUT.puts instruction.to_binary
    end
  end
end
