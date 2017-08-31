require "test_helper"

class CInstructionToBinaryTest < MiniTest::Test
  def test_translates_simple_expression
    @instruction = HackAssembler::CInstruction.new("M")

    assert_equal "1111110000000000", @instruction.to_binary
  end

  def test_translates_assignment
    @instruction = HackAssembler::CInstruction.new("D=M")

    assert_equal "1111110000010000", @instruction.to_binary
  end

  def test_translates_other_assignment
    @instruction = HackAssembler::CInstruction.new("    D=D+A")

    assert_equal "1110000010010000", @instruction.to_binary
  end

  def test_translates_jump_instruction
    @instruction = HackAssembler::CInstruction.new("D-1;JLE")

    assert_equal "1110001110000110", @instruction.to_binary
  end
end
