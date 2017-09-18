module HackRB
  module Assembler
    class Comment < Line
      def self.regexp
        /\/\/.*/
      end
    end
  end
end
