require "hack_assembler_test"

class AddTest < HackAssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Add")
  end
end
