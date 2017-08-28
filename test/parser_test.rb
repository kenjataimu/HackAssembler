require "test_helper"
require "hack_assembler/parser"

class ParserTest < MiniTest::Test
  def asm_file_path
    "test.asm"
  end

  def setup
    File.open(asm_file_path, "w") do |f|
      f.write(asm_code)
    end
    @parser = Parser.new(asm_file_path)
  end

  def teardown
    FileUtils.rm_f(asm_file_path)
  end
end
