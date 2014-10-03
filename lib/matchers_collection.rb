module PinshapeChallenge
  module MatchersCollection
    attr_accessor :matching_strategy
    
    def matching_strategy
      @matching_strategy ||= Matcher
    end

    def matchers
      @matchers ||= {}
    end

    def method_missing(method, criteria)
      if matching_strategy.respond_to? method
        matchers[method] = {
          strategy: matching_strategy,
          criteria: criteria
        }
        return self
      else
        super
      end
    end

  end
end
