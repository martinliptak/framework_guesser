require "framework_guesser/version"
require "framework_guesser/matcher"

module FrameworkGuesser
	def self.guess(headers, body)
		matcher = Matcher.new
		matcher.match(headers, body)
	end	
end
