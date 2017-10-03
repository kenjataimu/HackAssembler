require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class PushOperation < Line
      SEGMENTS = {
        "local" => "LCL",
        "argument" => "ARG",
        "this" => "THIS",
        "that" => "THAT"
      }

      def initialize(body, number, filename)
        super(body, number)
        @segment, @offset = self.class.regexp.match(body).captures
        @segment = SEGMENTS[@segment] || @segment
        @filename = filename.capitalize
      end

      def self.regexp
        /push (?<segment>\w+) (?<offset>\d+)/
      end

      def to_asm
        case @segment
        when "constant"
          %W[
            @#{@offset}
            D=A
            @SP
            M=M+1
            A=M-1
            M=D
          ]
        when "static"
          %W[
            @#{filename}.#{@offset}
            D=M
            @SP
            M=M+1
            A=M-1
            M=D
          ]
        when "temp"
          %W[
            @#{5 + @offset.to_i}
            D=M
            @SP
            M=M+1
            A=M-1
            M=D
          ]
        else
          %W[
            @#{@segment}
            D=M
            @#{@offset}
            A=D+A
            D=M
            @SP
            M=M+1
            A=M-1
            M=D
          ]
        end
      end
    end
  end
end
