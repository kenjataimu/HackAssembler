require "line/parse_test"

class ParseLabelTest < ParseTest
  def test_parses_valid_label
    assert_parses("(LABEL)")
  end

  def test_raises_on_invalid_label
    assert_raises_invalid("(invalid")
  end
end
