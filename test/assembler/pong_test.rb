require "assembler_test"

class PongTest < AssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Pong")
  end
end
