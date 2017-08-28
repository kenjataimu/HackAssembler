require "parser_test"

class EachInstructionTest < ParserTest
  def asm_code
    <<~ASM
     // ASM test code
     //

     @END
     D=M;JMP

     (END)
    ASM
  end

  def instruction(number)
    (number - 1).times { @each_instruction.next }
    @each_instruction.next
  end

  def setup
    super
    @each_instruction = @parser.each_instruction
  end

  def test_is_enumerator
    assert_instance_of Enumerator, @each_instruction
  end

  def test_yields_1st_instruction
    assert_instance_of AInstruction, instruction(1)
  end

  def test_1st_instruction_has_proper_body
    assert_equal "@END", instruction(1).body
  end

  def test_yields_2nd_instruction
    assert_kind_of CInstruction, instruction(2)
  end

  def test_2nd_instruction_has_proper_body
    assert_equal "D=M;JMP", instruction(2).body
  end

  def test_ends_on_5th_line
    assert_raises StopIteration do
      instruction(3)
    end
  end 
end
