require "test_helper"
require "hack_assembler/parser"

class ParserTest < MiniTest::Test
  def setup
    @parser = Parser.new(asm_code)
  end
end
