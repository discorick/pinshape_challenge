module PinshapeChallenge
  class StringLine
    include MatchersCollection
    
    def initialize(string)
      @line = string
    end

    def slice
      matchers.each do |matcher, key|
        matcher_klass = key[:strategy]
        match = matcher_klass.send(matcher, @line, key[:criteria])
        @line = match if match
      end
      @matchers = {}
      return @line.strip_saving_delimter("\n")
    end

    :private

  end
end
