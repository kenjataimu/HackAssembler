require "hack_assembler/line/instruction"

module HackAssembler
  class CInstruction < Instruction
    COMPUTATION = {
      "0"   =>  "101010",
      "1"   =>  "111111",
      "-1"  =>  "111010",
      "D"   =>  "001100",
      "A"   =>  "110000",
      "M"   =>  "110000",
      "!D"  =>  "001101",
      "!A"  =>  "110001",
      "!M"  =>  "110001",
      "-D"  =>  "001111",
      "-A"  =>  "110011",
      "-M"  =>  "110011",
      "D+1" =>  "011111",
      "A+1" =>  "110111",
      "M+1" =>  "110111",
      "D-1" =>  "001110",
      "A-1" =>  "110010",
      "M-1" =>  "110010",
      "D+A" =>  "000010",
      "D+M" =>  "000010",
      "D-A" =>  "010011",
      "D-M" =>  "010011",
      "A-D" =>  "000111",
      "M-D" =>  "000111",
      "D&A" =>  "000000",
      "D&M" =>  "000000",
      "D|A" =>  "010101",
      "D|M" =>  "010101"
    }

    DESTINATION = {
      "M"   => "001", 
      "D"   => "010",
      "MD"  => "011",
      "A"   => "100",
      "AM"  => "101",
      "AD"  => "110",
      "AMD" => "111"
    }

    JUMP = {
      "JGT" =>  "001", 
      "JEQ" =>  "010",
      "JGE" =>  "011",
      "JLT" =>  "100",
      "JNE" =>  "101",
      "JLE" =>  "110",
      "JMP" =>  "111"
    }

    def initialize(body)
      super
      extract_parts!
    end

    def to_binary
      "111#{a_bit}#{computation}#{destination}#{jump}"
    end

    private

    def a_bit
      @computation.include?("M") ? 1 : 0
    end

    def computation
      COMPUTATION[@computation]
    end

    def destination
      DESTINATION[@destination] || "000"
    end

    def jump
      JUMP[@jump] || "000"
    end

    def extract_parts!
      operation, @jump = @body.split(";")
      @destination, @computation = operation.split("=").tap do |operands|
        operands.unshift(nil) if operands.one?
      end
    end
  end
end
