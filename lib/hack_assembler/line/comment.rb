module HackAssembler
  class Comment < Line
    def self.regexp
      /\s*\/\/.*/
    end
  end
end
