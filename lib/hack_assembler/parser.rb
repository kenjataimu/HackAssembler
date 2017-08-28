require "hack_assembler/line"

class Parser
  def initialize(asm_file_path)
    @asm_file_path = asm_file_path
  end

  def each_instruction
    instructions.each
  end

  private

  def instructions
    @instructions ||= instructions_enum
  end

  def instructions_enum
    Enumerator.new do |enum|
      commands.with_index do |command, index|
        enum << command if command.is_a? Instruction
      end
    end
  end 

  def commands
    @commands ||= commands_enum
  end

  def commands_enum
    Enumerator.new do |enum|
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
