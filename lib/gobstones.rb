module StonesSpec
  module Gobstones
    def self.source_code_extension
      'gbs'
    end

    def self.board_extension
      'gbb'
    end

    class Error < Exception
    end

    class SyntaxError < Error
      def status
        :errored
      end
    end

    class AbortedError < Error
      def status
        :aborted
      end
    end
  end
end
