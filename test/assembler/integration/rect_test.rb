require "assembler/integration_test"

class RectTest < IntegrationTest
  def test_assembles_add_program
    assert_assembles_program("Rect")
  end
end
