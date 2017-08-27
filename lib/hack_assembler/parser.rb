require "hack_assembler/line"

class Parser
  def initialize(asm_code)
    @lines = parse(asm_code)
  end

  def each_line
    lines.each
  end

  private

  attr_reader :lines

  def parse(asm_code)
    asm_code.split("\n").map do |asm_line|
      Line.parse(asm_line)
    end
  end
end
