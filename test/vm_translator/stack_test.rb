require "test_helper"
require "hack_rb/vm_translator/virtual_machine"
require "hack_rb/vm_translator/stack"

class StackTest < MiniTest::Test
  def setup_vm_class_name
    HackRB::VMTranslator::VirtualMachine.class_name = "StackTest"
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

  def test_eq
    setup_vm_class_name
    assert_equal <<~EQ, HackRB::VMTranslator::Stack.eq
      @SP
      AM=M-1
      D=M
      A=A-1
      D=M-D
      @StackTest.True.1
      D;JEQ
      D=0
      @StackTest.End.1
      0;JMP
      (StackTest.True.1)
      D=-1
      (StackTest.End.1)
      @SP
      A=M-1
      M=D
    EQ
  end

  def test_gt
    setup_vm_class_name
    assert_equal <<~GT, HackRB::VMTranslator::Stack.gt
      @SP
      AM=M-1
      D=M
      A=A-1
      D=M-D
      @StackTest.True.1
      D;JGT
      D=0
      @StackTest.End.1
      0;JMP
      (StackTest.True.1)
      D=-1
      (StackTest.End.1)
      @SP
      A=M-1
      M=D
    GT
  end

  def test_lt
    setup_vm_class_name
    assert_equal <<~LT, HackRB::VMTranslator::Stack.lt
      @SP
      AM=M-1
      D=M
      A=A-1
      D=M-D
      @StackTest.True.1
      D;JLT
      D=0
      @StackTest.End.1
      0;JMP
      (StackTest.True.1)
      D=-1
      (StackTest.End.1)
      @SP
      A=M-1
      M=D
    LT
  end

  def test_and
    assert_equal <<~AND, HackRB::VMTranslator::Stack.and
      @SP
      AM=M-1
      D=M
      A=A-1
      M=D&M
    AND
  end

  def test_or
    assert_equal <<~OR, HackRB::VMTranslator::Stack.or
      @SP
      AM=M-1
      D=M
      A=A-1
      M=D|M
    OR
  end

  def test_not
    assert_equal <<~NOT, HackRB::VMTranslator::Stack.not
      @SP
      A=M-1
      M=!M
    NOT
  end
end
