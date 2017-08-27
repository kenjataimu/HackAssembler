$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "hack_assembler")

require "parser"

class HackAssembler
  def initialize(asm_file_path)
    @asm_file_path = asm_file_path
  end
end
