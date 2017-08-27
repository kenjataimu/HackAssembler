require "parser_test"

class EachLineTest < ParserTest
  def asm_code
    <<~ASM
     // ASM test code

     @label
     D=M;JMP
    ASM
  end

  def line(line_number)
    (line_number - 1).times { @each_line.next }
    @each_line.next
  end

  def setup
    super
    @each_line = @parser.each_line
  end

  def test_is_enumerator
    assert_instance_of Enumerator, @each_line
  end

  def test_yields_1st_line_as_comment
    assert_instance_of Comment, line(1)
  end

  def test_1st_line_has_proper_body
    assert_equal "// ASM test code", line(1).body
  end

  def test_yields_2nd_line_as_blank
    assert_instance_of Blank, line(2)
  end

  def test_2nd_line_has_proper_body
    assert_equal "", line(2).body
  end

  def test_yields_3rd_line_as_a_instruction
    assert_instance_of AInstruction, line(3)
  end

  def test_3rd_line_has_proper_body
    assert_equal "@label", line(3).body
  end

  def test_yields_4th_line_as_c_instruction
    assert_instance_of CInstruction, line(4)
  end

  def test_4th_line_has_proper_body
    assert_equal "D=M;JMP", line(4).body
  end

  def test_ends_on_5th_line
    assert_raises StopIteration do
      line(5)
    end
  end
end
