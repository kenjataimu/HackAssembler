require "test_helper"
require "hack_rb/vm_translator"

class IntegrationTest < MiniTest::Test
  class VMProgram
    def initialize(name)
      @name = name
    end

    def stream
      StringIO.new.tap do |s|
        s.write File.read(full_path("vm/#{@name}.vm"))
        s.rewind
      end
    end

    def asm
      File.read(full_path("asm/#{@name}.asm"))
    end

    private

    def full_path(file_path)
      File.join(Dir.pwd, "test/vm_translator/integration/files/#{file_path}")
    end
  end

  def assert_translates_program(program_name)
    program = VMProgram.new(program_name)
    output_stream = StringIO.new
    HackRB::VMTranslator.translate(program.stream, output_stream)
    output_stream.rewind

    assert_equal program.asm, output_stream.read
  end
end
