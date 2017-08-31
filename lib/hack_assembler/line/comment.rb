module HackAssembler
  class Comment < Line
    def self.regexp
      /\/\/.*/
    end
  end
end
