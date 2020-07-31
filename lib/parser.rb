module VMTranslator
  # Read VM commands, parses them, and provide access to thier components
  class Parser
    def initialize(file_name)
      @file_enumerator = File.foreach(file_name)
      @line = 0
    end

    def parse(code_writer)
      while has_more_commands
        advance
        case command_type
        when CommandType::C_PUSH
          code_writer.write_push('push', arg1, arg2, @line)
        when CommandType::C_POP
          code_writer.write_pop('pop', arg1, arg2, @line)
        when CommandType::C_ARITHMETIC
          code_writer.write_arithmethic(@current_command, @line)
        when CommandType::C_LABEL
          code_writer.write_label(arg1, @line)
        when CommandType::C_GOTO
          code_writer.write_goto(arg1, @line)
        when CommandType::C_IF_GOTO
          code_writer.write_if_goto(arg1, @line)
        when CommandType::C_FUNCTION
          code_writer.write_function(arg1, arg2.to_i, @line)
        when CommandType::C_RETURN
          code_writer.write_return(@line)
        else
          # puts "else line: #{@line}"
        end
      end
    end

    def arg1
      @current_command.split[1]
    end

    def arg2
      @current_command.split[2]
    end

    def advance
      @line += 1
      @current_command = @file_enumerator.next.strip
    end

    def has_more_commands
      @file_enumerator.peek
      true
    rescue StopIteration => ex
      return false
    end

    def command_type
      return CommandType::C_PUSH if @current_command.start_with?('push')
      return CommandType::C_POP if @current_command.start_with?('pop')
      return CommandType::C_ARITHMETIC if arithmetic_commands.include?(@current_command)
      return CommandType::C_LABEL if @current_command.start_with?('label')
      return CommandType::C_GOTO if @current_command.start_with?('goto')
      return CommandType::C_IF_GOTO if @current_command.start_with?('if-goto')
      return CommandType::C_FUNCTION if @current_command.start_with?('function')
      return CommandType::C_RETURN if @current_command.start_with?('return')
    end

    private

    # Pop two items off the stack, cumpute the compute the binary function on them,
    # and the push the result back on the stack
    # unary ones pops a single item
    # Each command has a net impack of replacing its operand(s) with commands result,
    # without affecting the rest of the stack
    def arithmetic_commands
      %w[
        add
        sub
        neg
        eq
        gt
        lt
        and
        or
        not
      ]
    end
  end
end
