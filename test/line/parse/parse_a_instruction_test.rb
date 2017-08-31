require "line/parse_test"

class ParseAInstructionTest < ParseTest
  def test_parses_simple_a_instruction
    assert_parses("@label")
  end

  def test_parses_upcased_a_instruction
    assert_parses("@END")
  end

  def test_raises_on_invalid_a_instruction
    assert_raises_invalid("@")
  end

  def test_parses_instruction_with_comment
    assert_parses("@var // simple var", "@var")
  end
end
