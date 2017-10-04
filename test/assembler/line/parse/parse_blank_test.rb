require "assembler/line/parse_test"

class ParseBlankTest < ParseTest
  def test_parses_empty_line
    assert_parses("")
  end

  def test_parses_white_chars_line
    assert_parses("             ", "")
  end
end
