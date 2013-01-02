module Helpers

  def run_matcher_on_fixture(fixture)
    matcher = FrameworkGuesser::Matcher.new
    headers, body = load_headers_and_body(fixture)
    matcher.match(headers, body)
  end

  def load_headers_and_body(fixture)
    headers = if File.exists?(File.dirname(__FILE__) + "/../fixtures/#{fixture}.yaml")
                YAML::load(File.read(File.dirname(__FILE__) + "/../fixtures/#{fixture}.yaml"))
              else
                {}
              end
    body = File.read(File.dirname(__FILE__) + "/../fixtures/#{fixture}.html")
    [headers, body]
  end
end
