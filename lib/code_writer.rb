module VMTranslator
  # Translate VM commands into Hack assembly code
  # Writes the assembly code that is the translation of given arithmetic, memory command
  class CodeWriter
    def initialize(output_filename)
      @output_file = File.new(output_filename, 'a')
      @current_line = nil
    end

    def write_arithmethic(command, line)
      @current_line = line
      translation = aritmetic_translation(command, line)
      @output_file.write(translation.join("\n"))
    end

    def write_push(command, segment, index, line)
      @current_line = line
      translation = translate_push(command, segment, index)
      @output_file.write(translation.join("\n"))
    end

    def write_pop(command, segment, index, line)
      @current_line = line
      translation = translate_pop(command, segment, index)
      @output_file.write(translation.join("\n"))
    end

    #
    # Program flow / Branching Commands
    #

    # VM initialization, bootstrap code
    # Must be placed at the begining of the output file
    def write_init; end

    # label command
    def write_label(label, line)
      @current_line = line
      translation = translate_label(label)
      @output_file.write(translation.join("\n"))
    end

    # goto command
    def write_goto(label, line)
      @current_line = line
      translation = translate_goto(label)
      @output_file.write(translation.join("\n"))
    end

    # if-goto command
    def write_if_goto(label, line)
      @current_line = line
      translation = translate_if_goto(label)
      @output_file.write(translation.join("\n"))
    end

    #
    # Function calling
    #

    # Function command
    # function f n
    # Starts the code of a function named f that has n local variables
    def write_function(function_name, num_locals, line)
      @current_line = line
      translation = translate_function(function_name, num_locals)
      @output_file.write(translation.join("\n"))
    end

    # Call function
    # call f m
    # call function f, stating that m arguments have already been pushed on the stack by the caller
    def write_call(function_name, num_args, line); end

    # Return to the calling function
    def write_return(line)
      @current_line = line
      translation = translate_return
      @output_file.write(translation.join("\n"))
    end

    private

    #
    # Function commands
    #

    # VM command:function f k
    # Declare a function f that has k local variables
    # Generated code(pseudo):
    # (f)       -- Declare a label for the function entry
    #   repeat k times:
    #   push 0  -- initailize all of them to 0
    # Each VM function f should generate a symbol f that refers to its entry point in the instruction memory
    # Allocate and initialize the local vars to 0
    #
    def translate_function(function_name, num_locals)
      str = [
        "\n// Function #{function_name} --line: #{@current_line}",
        # label function name
        "(#{function_name})"
      ]
      num_locals.times do |i|
        @current_line += 1
        str << translate_push_constant('push', 'constant', 0).join("\n")
        @current_line += 1
        str << translate_pop('pop', 'local', i).join("\n")
      end
      str
    end

    # VM command: return
    # Return from a function
    # Generated pseudo code:
    #   endFrame = LCL            -- endFrame is a tmp variable
    #   retAddr = *(endFrame - 5) -- put the return addr into tmp var
    #   *ARG = pop()              -- Reposition the return value for the caller
    #   SP   = ARG + 1            -- Restore SP of the caller
    #   THAT = *(endFrame - 1)    -- Restore THAT of the caller
    #   THIS = *(endFrame - 2)    -- Restore THIS of the caller
    #   ARG  = *(endFrame - 3)    -- Restore ARG of the caller
    #   LCL  = *(endFrame - 4)    -- Restore LCL of the caller
    #   goto retAddr              -- Goto return address in the caller's code
    def translate_return
      [
        "\n// return --line: #{@current_line}",
        # endFrame = LCL
        '@LCL',
        'D=M',
        '@endFrame',
        'M=D',
        # retAddr = *(endFrame - 5)
        '@endFrame',
        'D=M',
        '@5',
        'D=D-A',
        'A=D',
        'D=M',
        '@retAddr',
        'M=D',
        # *ARG = pop()
        '@SP',
        'M=M-1',
        'A=M',
        'D=M',
        '@ARG',
        'A=M',
        'M=D',
        # SP = ARG + 1
        '@ARG',
        'D=M',
        'D=D+1',
        '@SP',
        'M=D',
        # THAT = *(endFrame - 1)
        '@endFrame',
        'D=M',
        'D=D-1',
        'A=D',
        'D=M',
        '@THAT',
        'M=D',
        # THIS = *(endFrame - 2)
        '@endFrame',
        'D=M',
        '@2',
        'D=D-A',
        'A=D',
        'D=M',
        '@THIS',
        'M=D',
        # ARG = *(endFrame - 3)
        '@endFrame',
        'D=M',
        '@3',
        'D=D-A',
        'A=D',
        'D=M',
        '@ARG',
        'M=D',
        # LCL = *(endFrame - 4)
        '@endFrame',
        'D=M',
        '@4',
        'D=D-A',
        'A=D',
        'D=M',
        '@LCL',
        'M=D',
        # goto retAddr
        '@retAddr',
        'A=M',
        '0;JMP'
      ]
    end

    # VM command: call f n
    # Calling a function f after n arguments have been pushed onto the stack
    # Generated pseudo code:
    #   push return-address -- Using the label declared below
    #   push LCL            -- Save LCL of the calling function
    #   push ARG            -- Save ARG of the calling function
    #   push THIS           -- Save THIS of the calling function
    #   push THAT           -- Save THAT of the calling function
    #   ARG = SP - n - 5    -- Reposition ARG, n:number of arguments
    #   LCL = SP            -- Reposition LCL
    #   goto f              -- Transfer control
    # (return-address)
    def tranlsate_call; end

    #
    # Program flow commands
    #

    # label label
    # labels the current location in the function's code
    def translate_label(label)
      [
        "\n// label #{label} --line: #{@current_line}",
        "(#{label})"
      ]
    end

    # goto label
    # unconditional goto operation
    # causing execution to continue from the location marked by the label
    # jump destination must be located in the same function
    def translate_goto(label)
      [
        "\n// goto #{label} --line: #{@current_line}",
        "@#{label}",
        '0;JMP'
      ]
    end

    # if-goto label
    # conditional goto operation
    # The stack's top most value is popped
    # if the value is not zero execution continues from the location marked by label
    # otherwise, continues from the next command
    def translate_if_goto(label)
      [
        "\n// if_goto #{label} --line: #{@current_line}",
        '@SP',
        'AM=M-1',
        'D=M',
        "@#{label}",
        'D;JGT'
      ]
    end

    #
    # Memory Access Commands
    #

    #
    # Memory Segments Mappping
    # Each segment is mapped direclty on the RAM, and its location is maintained
    # by keeping its physical base address in a dedicated register(LCL, ARG, THIS, THAT etc)
    # Segment[i] -> RAM[base + i]
    def segment_base_addr
      {
        local: 'LCL',
        argument: 'ARG',
        this: 'THIS',
        that: 'THAT',
        pointer: 3,
        temp: 5
      }
    end

    # push segment index: Push the value of segment[index] on the stack
    # addr = segment_base_addr + index, *SP = *addr, SP++
    # Current VM function's respective segment
    # SP points to the next topmost location in the stack
    def translate_push(command, segment, index)
      return translate_push_constant(command, segment, index) if segment == 'constant'
      [
        "\n// #{command} #{segment} #{index} --line: #{@current_line}",
        "@#{segment_base_addr[segment.to_sym]}",
        %w[pointer temp].include?(segment) ? 'D=A' : 'D=M',
        "@#{index}",
        'D=D+A', # D = RAM[LCL] + index -- addr = LCL + index
        'A=D',
        'D=M', # D = RAM[RAM[LCL] + index] -- *addr
        '@SP',
        'A=M', # A = RAM[SP]
        'M=D', # *SP = *addr
        '@SP',
        'M=M+1' # SP++
      ]
    end

    # pop segment index: Pop the top stack value and store it in segment[index]
    # addr = segment_base_addr + index, SP--, *addr = *SP
    def translate_pop(command, segment, index)
      [
        "\n// #{command} #{segment} #{index} --line: #{@current_line}",
        "@#{segment_base_addr[segment.to_sym]}",
        %w[pointer temp].include?(segment) ? 'D=A' : 'D=M',
        "@#{index}",
        'D=D+A', # D = segment_base_addr + index
        "@addr_#{@current_line}",
        'M=D', # addr_line = segment_base_addr + index
        '@SP',
        'M=M-1', # SP--
        'A=M',
        'D=M',
        "@addr_#{@current_line}",
        'A=M',
        'M=D' # *addr = *SP

      ]
    end

    def translate_push_constant(command, segment, value)
      [
        "\n// #{command} #{segment} #{value} --line: #{@current_line}",
        ## *SP = index
        "@#{value}", # A=index
        'D=A', # D=index,
        '@SP', # A=SP and RAM[SP] selected, M = RAM[SP]
        'A=M', # A=RAM[SP], A=*SP
        'M=D', # RAM[SP] = index, *SP = index
        ## SP++
        '@SP', # M=RAM[SP]
        'M=M+1' # RAM[SP] = RAM[SP] + 1
      ]
    end

    #
    # Stack Arithmetic
    #
    def aritmetic_translation(command, line)
      map = {
        add: :translate_arithmetic_add,
        sub: :translate_arithmetic_sub,
        eq: :translate_arithmetic_eq,
        lt: :translate_arithmetic_lt,
        gt: :translate_arithmetic_gt,
        neg: :translate_arithmetic_neg,
        and: :translate_logical_and,
        or: :translate_logical_or,
        not: :translate_logical_not
      }

      send(map[command.to_sym], command, line)
    end

    def translate_arithmetic_lt(_command, line)
      [
        "\n// lt ",
        'AM=M-1',
        'D=M',
        'A=A-1',
        'D=M-D',
        "@LT_#{line}",
        # false part
        'D;JLT',
        '@SP',
        'A=M-1',
        'M=0',
        "@END_#{line}",
        '0;JMP',
        "(LT_#{line})",
        # true part
        '@SP',
        'A=M-1',
        'M=-1',
        "(END_#{line})"
      ]
    end

    def translate_arithmetic_gt(_command, line)
      [
        "\n// gt ",
        'AM=M-1',
        'D=M',
        'A=A-1',
        'D=M-D',
        "@GT_#{line}",
        'D;JGT',
        # false part
        '@SP',
        'A=M-1',
        'M=0',
        "@END_#{line}",
        '0;JMP',
        "(GT_#{line})",
        # true part
        '@SP',
        'A=M-1',
        'M=-1',
        "(END_#{line})"
      ]
    end

    def translate_arithmetic_eq(_command, line)
      [
        "\n// eq ",
        'AM=M-1',
        'D=M',
        'A=A-1',
        'D=M-D',
        "@EQ_#{line}",
        # false part
        'D;JEQ',
        '@SP',
        'A=M-1',
        'M=0',
        "@END_#{line}",
        '0;JMP',
        "(EQ_#{line})",
        # true part
        '@SP',
        'A=M-1',
        'M=-1',
        "(END_#{line})"
      ]
    end

    def translate_arithmetic_add(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'AM=M-1', # A = RAM[SP] - 1 , M = RAM[RAM[SP] - 1]
        'D=M', # D = RAM[RAM[SP] - 1]
        'A=A-1', # A = RAM[SP] - 2, M = RAM[RAM[SP] -2]
        'M=D+M' # RAM[RAM[SP] -2] = RAM[RAM[SP] - 1] + RAM[RAM[SP] -2]
      ]
    end

    # sub: x - y -- push x, push y
    def translate_arithmetic_sub(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'AM=M-1', # A = RAM[SP] - 1 , M = RAM[RAM[SP] - 1]
        'D=M', # D = RAM[RAM[SP] - 1]
        'A=A-1', # A = RAM[SP] - 2, M = RAM[RAM[SP] -2]
        'M=M-D' # RAM[RAM[SP] -2] = RAM[RAM[SP] - 1] + RAM[RAM[SP] -2]
      ]
    end

    # sub: -y
    def translate_arithmetic_neg(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'A=M-1',
        'M=-M'
      ]
    end

    # x and y -- bitwise
    def translate_logical_and(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'AM=M-1', # A = RAM[SP] - 1 , M = RAM[RAM[SP] - 1]
        'D=M', # D = RAM[RAM[SP] - 1]
        'A=A-1', # A = RAM[SP] - 2, M = RAM[RAM[SP] -2]
        'M=D&M' # RAM[RAM[SP] -2] = RAM[RAM[SP] - 1] + RAM[RAM[SP] -2]
      ]
    end

    # x or y -- bitwise
    def translate_logical_or(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'AM=M-1', # A = RAM[SP] - 1 , M = RAM[RAM[SP] - 1]
        'D=M', # D = RAM[RAM[SP] - 1]
        'A=A-1', # A = RAM[SP] - 2, M = RAM[RAM[SP] -2]
        'M=D|M' # RAM[RAM[SP] -2] = RAM[RAM[SP] - 1] + RAM[RAM[SP] -2]
      ]
    end

    # Not y -- bitwise
    def translate_logical_not(command, line)
      [
        "\n// #{command} line:#{line}",
        '@SP', # A=0, M = RAM[SP], M = *SP
        'A=M-1',
        'M=!M'
      ]
    end
  end
end
