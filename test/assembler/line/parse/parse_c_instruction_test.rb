require "assembler/line/parse_test"

class ParseCInstructionTest < ParseTest
  def test_parses_simple_expression
    assert_parses("M")
  end

  def test_parses_assignment
    assert_parses("D=M")
  end

  def test_parses_jump_instruction
    assert_parses("D-1;JLE")
  end

  def test_raises_on_invalid_c_instruction
    assert_raises_invalid("A-M;JMP")
  end

  def test_parses_instruction_with_comment
    assert_parses("D-1;JLE // some comment", "D-1;JLE")
  end
end
