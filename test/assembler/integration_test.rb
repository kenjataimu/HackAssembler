require "test_helper"
require "hack_rb/assembler"

class IntegrationTest < MiniTest::Test
  class HackTestProgram
    def initialize(name)
      @name = name
    end

    def stream
      StringIO.new.tap do |s|
        s.write File.read(full_path("asm/#{@name}.asm"))
        s.rewind
      end
    end

    def binary
      File.read(full_path("binary/#{@name}.hack"))
    end

    private

    def full_path(file_path)
      File.join(Dir.pwd, "test/assembler/integration/files/#{file_path}")
    end
  end

  def assert_assembles_program(program_name)
    program = HackTestProgram.new(program_name)
    output_stream = StringIO.new
    HackRB::Assembler.assembly(program.stream, output_stream)
    output_stream.rewind

    assert_equal program.binary, output_stream.read
  end
end
