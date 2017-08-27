require "line/parse_test"

class ParseCommentTest < ParseTest
  def test_parses_normal_comment
    assert_parses("// comment")
  end

  def test_parses_empty_comment
    assert_parses("//")
  end

  def test_parses_special_chars_comment
    assert_parses("////*****////other comment !@#$%^&*() /////*****/")
  end

  def test_parses_very_long_comment
    assert_parses("// veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong comment")
  end
end
