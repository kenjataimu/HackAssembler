require "hack_assembler/line/command"

class Label < Command
  def name
    @name ||= body[1..-2]
  end
end
