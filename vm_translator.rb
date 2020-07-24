require_relative 'lib/parser'
require_relative 'lib/code_writer'
require_relative 'lib/command_type'

module VMTranslator
  def self.run
    file_name = ARGV[0]
    return unless file_name
    parser = Parser.new(file_name)
    basename = File.basename(file_name, '.vm')
    output_file_name = "#{basename}.asm"
    File.delete(output_file_name) if File.exist?(output_file_name)
    code_writer = CodeWriter.new(output_file_name)
    parser.parse(code_writer)
  end
end
