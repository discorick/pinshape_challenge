require_relative 'lib/pinshape_challenge'

Dir.glob('lib/*_spec.rb') do |spec|
  require File.expand_path(spec)
end
