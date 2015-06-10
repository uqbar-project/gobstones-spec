class String
  def start_with_lowercase?
    first_letter = self[0]
    first_letter.downcase == first_letter
  end
end

module StonesSpec::Language
  module Gobstones

    def self.source_code_extension
      'gbs'
    end

    def self.run(source_file, initial_board_file, final_board_file)
      "#{gobstones_command} #{source_file.path} --from #{initial_board_file.path} --to #{final_board_file.path} --no-print-board --silent"
    end

    def self.gobstones_command
      'python .heroku/vendor/pygobstones-lang/gbs.py'
    end

    def self.parse_error_message(result)
      "<pre>#{ErrorMessageParser.new.parse(result)}</pre>"
    end

    def self.parse_success_output(result)
      get_first_return_value result || ''
    end

    def self.test_procedure(original, subject, args)
      "program {
        #{subject}(#{args.join(',')})
      }

      #{original}"
    end

    def self.test_function(original, subject, args)
      "program {
        return (#{subject}(#{args.join(',')}))
      }

      #{original}"
    end

    def self.infer_subject_type_for(string)
      string.start_with_lowercase? ? StonesSpec::Subject::Function : StonesSpec::Subject::Procedure
    end

    private

    def self.get_first_return_value(result)
      result[/#1 -> (\w+)/, 1]
    end
  end

  class ErrorMessageParser
    def remove_traceback (x)
      x.take_while { |str| not str.start_with? 'Traceback' }
    end

    def remove_line_specification(x)
      x.drop(3)
    end

    def remove_boom_line_specification(x)
      x.take_while { |str| not str.strip.start_with? 'En:' }
    end

    def parse(result)
      remove_boom_line_specification(remove_traceback(remove_line_specification(result.lines))).join.strip
    end
  end
end
