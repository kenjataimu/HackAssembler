require "assembler_test"

class AddTest < AssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Add")
  end
end
