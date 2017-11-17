require "test_helper"
require "hack_rb/vm_translator/virtual_machine"
require "hack_rb/vm_translator/stack"
require "hack_rb/vm_translator/segment"

class StackTest < MiniTest::Test
  def setup_vm_class_name
    HackRB::VMTranslator::VirtualMachine.current_class = "StackTest"
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

  def test_push_argument_1
    argument = HackRB::VMTranslator::Segment::Argument
    assert_equal <<~PUSH_ARGUMENT_1, HackRB::VMTranslator::Stack.push(argument, 1)
      @ARG
      D=M
      @1
      A=D+A
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_ARGUMENT_1
  end

  def test_push_local_17
    local = HackRB::VMTranslator::Segment::Local
    assert_equal <<~PUSH_LOCAL_17, HackRB::VMTranslator::Stack.push(local, 17)
      @LCL
      D=M
      @17
      A=D+A
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_LOCAL_17
  end

  def test_push_static_456
    setup_vm_class_name
    static = HackRB::VMTranslator::Segment::Static
    assert_equal <<~PUSH_STATIC_456, HackRB::VMTranslator::Stack.push(static, 456)
      @StackTest.456
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_STATIC_456
  end

  def test_push_constant_234
    constant = HackRB::VMTranslator::Segment::Constant
    assert_equal <<~PUSH_CONSTANT_234, HackRB::VMTranslator::Stack.push(constant, 234)
      @234
      D=A
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_CONSTANT_234
  end

  def test_push_this_7
    this = HackRB::VMTranslator::Segment::This
    assert_equal <<~PUSH_THIS_7, HackRB::VMTranslator::Stack.push(this, 7)
      @THIS
      D=M
      @7
      A=D+A
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_THIS_7
  end

  def test_push_that_13
    that = HackRB::VMTranslator::Segment::That
    assert_equal <<~PUSH_THAT_13, HackRB::VMTranslator::Stack.push(that, 13)
      @THAT
      D=M
      @13
      A=D+A
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_THAT_13
  end

  def test_push_pointer_0
    pointer = HackRB::VMTranslator::Segment::Pointer
    assert_equal <<~PUSH_POINTER_0, HackRB::VMTranslator::Stack.push(pointer, 0)
      @THIS
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_POINTER_0
  end

  def test_push_pointer_1
    pointer = HackRB::VMTranslator::Segment::Pointer
    assert_equal <<~PUSH_POINTER_1, HackRB::VMTranslator::Stack.push(pointer, 1)
      @THAT
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_POINTER_1
  end

  def test_push_temp_3
    temp = HackRB::VMTranslator::Segment::Temp
    assert_equal <<~PUSH_TEMP_3, HackRB::VMTranslator::Stack.push(temp, 3)
      @8
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    PUSH_TEMP_3
  end

  def test_pop_argument_10
    argument = HackRB::VMTranslator::Segment::Argument
    assert_equal <<~POP_ARGUMENT_10, HackRB::VMTranslator::Stack.pop(argument, 10)
      @ARG
      D=M
      @10
      D=D+A
      @R13
      M=D
      @SP
      AM=M-1
      D=M
      @R13
      A=M
      M=D
    POP_ARGUMENT_10
  end

  def test_pop_local_12
    local = HackRB::VMTranslator::Segment::Local
    assert_equal <<~POP_LOCAL_12, HackRB::VMTranslator::Stack.pop(local, 12)
      @LCL
      D=M
      @12
      D=D+A
      @R13
      M=D
      @SP
      AM=M-1
      D=M
      @R13
      A=M
      M=D
    POP_LOCAL_12
  end

  def test_pop_static_53
    setup_vm_class_name
    static = HackRB::VMTranslator::Segment::Static
    assert_equal <<~POP_STATIC_53, HackRB::VMTranslator::Stack.pop(static, 53)
      @SP
      AM=M-1
      D=M
      @StackTest.53
      M=D
    POP_STATIC_53
  end

  def test_pop_this_2
    this = HackRB::VMTranslator::Segment::This
    assert_equal <<~POP_THIS_2, HackRB::VMTranslator::Stack.pop(this, 2)
      @THIS
      D=M
      @2
      D=D+A
      @R13
      M=D
      @SP
      AM=M-1
      D=M
      @R13
      A=M
      M=D
    POP_THIS_2
  end

  def test_pop_that_10
    that = HackRB::VMTranslator::Segment::That
    assert_equal <<~POP_THAT_10, HackRB::VMTranslator::Stack.pop(that, 10)
      @THAT
      D=M
      @10
      D=D+A
      @R13
      M=D
      @SP
      AM=M-1
      D=M
      @R13
      A=M
      M=D
    POP_THAT_10
  end

  def test_pop_pointer_0
    pointer = HackRB::VMTranslator::Segment::Pointer
    assert_equal <<~POP_POINTER_0, HackRB::VMTranslator::Stack.pop(pointer, 0)
      @SP
      AM=M-1
      D=M
      @THIS
      M=D
    POP_POINTER_0
  end

  def test_pop_pointer_1
    pointer = HackRB::VMTranslator::Segment::Pointer
    assert_equal <<~POP_POINTER_1, HackRB::VMTranslator::Stack.pop(pointer, 1)
      @SP
      AM=M-1
      D=M
      @THAT
      M=D
    POP_POINTER_1
  end

  def test_pop_temp_2
    temp = HackRB::VMTranslator::Segment::Temp
    assert_equal <<~POP_TEMP_2, HackRB::VMTranslator::Stack.pop(temp, 2)
      @SP
      AM=M-1
      D=M
      @7
      M=D
    POP_TEMP_2
  end
end
