module PinshapeChallenge
  class Matcher

    def self.following(string, criteria)
      match = string.dup
      criteria.each do |crit|
        match.gsub!(/#{crit}.*/, "")
      end
      return match
    end

  end
end
