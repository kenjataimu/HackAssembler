require "hack_assembler_test"

class PongTest < HackAssemblerTest
  def test_assembles_add_program
    assert_assembles_program("Pong")
  end
end
