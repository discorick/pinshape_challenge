module PinshapeChallenge
  class StringLineIterator
    @line_object ||=  StringLine
    class << self
      attr_accessor :line_object
    end

    def self.using(string, &block)
      new_string = ""
      string.lines.each do |line_from_string|
        line_instance = @line_object.new(line_from_string)
        new_string << block.call(line_instance)
      end
      return new_string
    end
  end
end
