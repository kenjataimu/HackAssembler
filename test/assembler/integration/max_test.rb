require "assembler/integration_test"

class MaxTest < IntegrationTest
  def test_assembles_add_program
    assert_assembles_program("Max")
  end
end
