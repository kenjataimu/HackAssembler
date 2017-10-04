require "assembler/integration_test"

class PongTest < IntegrationTest
  def test_assembles_add_program
    assert_assembles_program("Pong")
  end
end
