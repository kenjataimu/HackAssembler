require "test_helper"

class AInstructionToBinaryTest < MiniTest::Test
  def test_translates_decimal_label
    @instruction = HackRB::Assembler::AInstruction.new("@1234")

    assert_equal "0000010011010010", @instruction.to_binary
  end

  def test_translates_symbolic_label_after_setting_address
    @instruction = HackRB::Assembler::AInstruction.new("@label")
    @instruction.address = 4567

    assert_equal "0001000111010111", @instruction.to_binary
  end
end
