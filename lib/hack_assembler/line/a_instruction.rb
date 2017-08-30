require "hack_assembler/line/instruction"

module HackAssembler
  class AInstruction < Instruction
    attr_accessor :address

    def self.regexp
      /\@\S+/
    end

    def numeric?
      label =~ /^\d+$/
    end

    def symbolic?
      !numeric?
    end

    def label
      body[1..-1]
    end

    def to_binary
      "0%015b" % decimal_address
    end

    private

    def decimal_address
      address || label.to_i
    end
  end
end
