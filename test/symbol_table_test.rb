require "test_helper"
require "hack_assembler/symbol_table"

class SymbolTableTest < MiniTest::Test
  def setup
    @symbol_table = SymbolTable.new
  end

  def test_initializes_with_default_symbols
    assert_equal 0, @symbol_table.get("R0")
  end

  def test_sets_new_symbols
    @symbol_table.set("New symbol", 123)

    assert_equal 123, @symbol_table.get("New symbol")
  end

  def test_does_not_overwrite_symbols
    @symbol_table.set("R5", 987)

    assert_equal 5, @symbol_table.get("R5")
  end
end
