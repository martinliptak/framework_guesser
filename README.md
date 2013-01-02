# framework_guesser

Framework guesser tries to detect frameworks and javascript libraries from HTML code 
and HTTP headers hash. Some extra information like server, server-side programming language, doctype, meta description and keywords are returned as well. 

It is used by [statscrawler.com][1] to analyze sites and collect statistics about 
Internet domains. This is a sample (though working and pretty usable) for everyone 
interested in framework detection on statscrawler.com.  

[1]: http://www.statscrawler.com

## Usage

Requires nokogiri and rspec for tests.

```ruby
	require 'open-uri'
	require 'openssl'
	require 'framework_guesser'

	for domain in ['rubyonrails.org', 'drupal.org', 'wordpress.org', 'joomla.org']
	  begin
	    open("http://www." + domain,
	        :read_timeout => 10,
	        :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) do |file|
	        
	      url = file.base_uri.to_s
	      
	      result = FrameworkGuesser.guess(file.meta, file.read)
	      puts "#{domain} => #{url}"
	      puts "Description: #{result[:description]}"
	      puts "Keywords: #{result[:keywords]}"
	      puts "Server: #{result[:server]}"
	      puts "Engine: #{result[:engine]}"
	      puts "Doctype: #{result[:doctype]}"
	      puts "Framework: #{result[:framework]}"
	      puts "Features: #{result[:features].join(', ')}"
	      
	      puts
	    end
	  rescue StandardError => err
	    puts "#{domain} => #{err.message}"
	  end
	end
```
