require "hack_assembler/line"
require "hack_assembler/symbol_table"

module HackAssembler
  class Parser
    def initialize(stream)
      @stream = stream
      @symbol_table = SymbolTable.new
    end

    def instructions
      @instructions ||= Enumerator.new do |enum|
        extract_instructions.each do |instruction|
          if instruction.is_a?(AInstruction)
            handle_address(instruction) 
          end

          enum << instruction
        end
      end
    end

    private

    def extract_instructions
      number = 0

      commands.reject do |command|
        command.is_a?(Label).tap do |label|
          if label
            @symbol_table.set(command.name, number)
          else
            number += 1
          end
        end
      end
    end

    def commands
      @commands ||= Enumerator.new do |enum|
        each_line do |line|
          enum << line if line.is_a? Command
        end
      end
    end

    def each_line
      while asm_line = @stream.gets
        yield Line.parse(asm_line.chomp)
      end
    end

    def handle_address(instruction)
      if instruction.symbolic?
        instruction.address = @symbol_table.get(instruction.label)
      end
    end
  end
end
