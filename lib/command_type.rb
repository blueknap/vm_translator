module VMTranslator
  module CommandType
    # Arithmetic
    C_PUSH = 'c_push'.freeze
    C_POP = 'c_pop'.freeze
    C_ARITHMETIC = 'c_arithmetic'.freeze

    # Program flow
    C_LABEL = 'c_label'.freeze
    C_IF_GOTO = 'c_if_goto'.freeze
    C_GOTO = 'c_goto'.freeze

    # Function, call and return
    C_FUNCTION = 'c_function'.freeze
    C_RETURN = 'c_return'.freeze
    C_CALL = 'c_call'.freeze
  end
end
