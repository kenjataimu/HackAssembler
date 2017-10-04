require "assembler/integration_test"

class AddTest < IntegrationTest
  def test_assembles_add_program
    assert_assembles_program("Add")
  end
end
