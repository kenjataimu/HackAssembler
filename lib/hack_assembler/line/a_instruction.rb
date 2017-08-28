require "hack_assembler/line/instruction"

class AInstruction < Instruction
  attr_accessor :address

  def numeric?
    label =~ /^\d+$/
  end

  def symbolic?
    !numeric?
  end

  def label
    body[1..-1]
  end
end
