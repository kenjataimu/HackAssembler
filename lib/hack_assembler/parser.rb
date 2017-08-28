require "hack_assembler/line"

class Parser
  def initialize(asm_file_path)
    @asm_file_path = asm_file_path
    @symbol_table = {}
  end

  def each_instruction
    instructions.each
  end

  private

  def instructions
    @instructions ||= extract_instructions
  end

  def extract_instructions
    instruction_number = 0

    commands.reject do |command|
      command.is_a?(Label).tap do |label|
        if label
          @symbol_table[command.name] ||= instruction_number
        else
          instruction_number += 1
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
    File.open(@asm_file_path) do |file|
      while asm_line = file.gets&.chomp
        yield Line.parse(asm_line)
      end
    end
  end
end
