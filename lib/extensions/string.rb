class String

  def strip_saving_delimter(delimeter)
    if self[-1] == delimeter
      return "#{self.strip}#{delimeter}"
    else
      self.strip
    end
  end

end
