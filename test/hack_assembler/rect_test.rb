require "hack_assembler_test"

class RectTest < HackAssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Rect")
  end
end
