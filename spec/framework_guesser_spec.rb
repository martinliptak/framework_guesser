require 'spec_helper'

describe FrameworkGuesser do

  it "should guess framework" do
    headers, body = load_headers_and_body('facebook-1')
    result = FrameworkGuesser::guess(headers, body)
    result[:description].should == "0101.sk domena plna zabavy, vtipy, humor, zabava, online hry a omnoho viac"
    result[:keywords].should == "nesmrtelnost,extra vtipy,vtip baza,humorne situacie,morbidne obrazky,domena plna zabavy"
    result[:server].should == :nginx
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :jquery
    result[:features].should include :facebook
    result[:features].should include :google_adsense
    result[:features].should include :google_analytics
    result[:features].size.should == 4
  end
end
