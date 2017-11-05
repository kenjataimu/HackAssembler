require "test_helper"
require "hack_rb/vm_translator/stack"

class StackTest < MiniTest::Test
  def test_push_d
    assert_equal <<~PUSH_D, HackRB::VMTranslator::Stack.push_d
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_D
  end

  def test_pop_d
    assert_equal <<~POP_D, HackRB::VMTranslator::Stack.pop_d
      @SP
      AM=M-1
      D=M
    POP_D
  end

  def test_add
    assert_equal <<~ADD, HackRB::VMTranslator::Stack.add
      @SP
      AM=M-1
      D=M
      A=A-1
      M=D+M
    ADD
  end

  def test_sub
    assert_equal <<~SUB, HackRB::VMTranslator::Stack.sub
      @SP
      AM=M-1
      D=M
      A=A-1
      M=M-D
    SUB
  end

  def test_neg
    assert_equal <<~NEG, HackRB::VMTranslator::Stack.neg
      @SP
      A=M-1
      M=-M
    NEG
  end
end
