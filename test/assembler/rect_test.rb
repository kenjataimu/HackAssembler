require "assembler_test"

class RectTest < AssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Rect")
  end
end
