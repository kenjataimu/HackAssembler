require "test_helper"
require "hack_assembler/parser"

class ParserTest < MiniTest::Test
  def setup
    @stream = StringIO.new
    @stream.write(asm_code)
    @stream.rewind
    @parser = HackAssembler::Parser.new(@stream)
  end
end
