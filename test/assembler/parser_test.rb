require "test_helper"
require "hack_rb/assembler/parser"

class ParserTest < MiniTest::Test
  def setup
    @stream = StringIO.new
    @stream.write(asm_code)
    @stream.rewind
    @parser = HackRB::Assembler::Parser.new(@stream)
  end
end
