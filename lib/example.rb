require 'ostruct'

module StonesSpec
  class Example < OpenStruct
    def initialize(subject, attributes)
      super attributes
      @title = attributes[:title]
      @subject = subject
      @precondition = Precondition.from_example(self)
    end

    def execution_data(source)
      { source: @subject.test_program(source, @precondition.arguments),
        initial_board: @precondition.initial_board_gbb }
    end

    def execute!(files, parser)
      # the parser must return something like { result, status }
      # possible status values are: :passed, :failed, :runtime_error, :syntax_error
      parser.run(files[:source], files[:initial_board], files[:final_board])
    end

    def result(files, execution, postcondition)
      if execution[:status] == :syntax_error
        raise Gobstones::SyntaxError, execution[:result]
      end

      if execution[:status] == :runtime_error
        raise Gobstones::AbortedError, execution[:result]
      end

      postcondition.validate(files[:initial_board].open.read, files[:final_board].open.read, execution[:result], execution[:status])
    end

    def title
      @title || default_title
    end

    private

    def default_title
      @subject.default_title @precondition.arguments
    end
  end
end
