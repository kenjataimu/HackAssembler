require "assembler_test"

class MaxTest < AssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Max")
  end
end
