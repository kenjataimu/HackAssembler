require "line_test"

class ParseTest < LineTest
  def setup
    super

    @type = Object.const_get("HackAssembler::#{self.class.to_s[5..-5]}")
  end

  def assert_parses(asm_line, output=asm_line)
    line = HackAssembler::Line.parse(asm_line)
    assert_instance_of @type, line
    assert_equal output, line.body
  end

  def assert_raises_invalid(asm_line)
    assert_raises "HackAssembler::Line::InvalidLineError" do
      HackAssembler::Line.parse(asm_line)
    end
  end
end
