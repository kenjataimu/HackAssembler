require "hack_assembler_test"

class MaxTest < HackAssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Max")
  end
end
