class SymbolTable
  def initialize
    @table = {
      "SP"   => 0,
      "LCL"  => 1,
      "ARG"  => 2,
      "THIS" => 3,
      "THAT" => 4,
      "R0"   => 0,
      "R1"   => 1,
      "R2"   => 2,
      "R3"   => 3,
      "R4"   => 4,
      "R5"   => 5,
      "R6"   => 6,
      "R7"   => 7,
      "R8"   => 8,
      "R9"   => 9,
      "R10"  => 10,
      "R11"  => 11,
      "R12"  => 12,
      "R13"  => 13,
      "R14"  => 14,
      "R15"  => 15
    }
    @free_address = 16
  end

  def set(symbol, value)
    @table[symbol] ||= value
  end

  def get(symbol)
    @table[symbol] ||= next_address
  end

  private

  def next_address
    @free_address.tap { @free_address += 1 }
  end
end
