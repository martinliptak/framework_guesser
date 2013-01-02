require 'spec_helper'

describe FrameworkGuesser::Matcher do

  it "should detect facebook 1" do
    result = run_matcher_on_fixture('facebook-1')
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

  it "should detect facebook 2" do
    result = run_matcher_on_fixture('facebook-2')
    result[:server].should == :nginx
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :mootools
    result[:features].should include :facebook
    result[:features].should include :google_analytics
    result[:features].size.should == 3
  end

  it "should detect facebook 3" do
    result = run_matcher_on_fixture('facebook-3')
    result[:server].should == :nginx
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 transitional//en\""
    result[:framework].should == :wordpress
    result[:features].should include :jquery
    result[:features].should include :facebook
    result[:features].size.should == 2
  end

  it "should detect drupal 1" do
    result = run_matcher_on_fixture('drupal-1')
    result[:server].should == :apache
    result[:framework].should == :drupal
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :jquery
    result[:features].size.should == 1
  end

  it "should detect drupal 2" do
    result = run_matcher_on_fixture('drupal-2')
    result[:server].should == :apache
    result[:framework].should == :drupal
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :jquery
    result[:features].size.should == 1
  end

  it "should detect drupal 3" do
    result = run_matcher_on_fixture('drupal-3')
    result[:server].should == :apache
    result[:framework].should == :drupal
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
  end

  it "should detect drupal 4" do
    result = run_matcher_on_fixture('drupal-4')
    result[:framework].should == :drupal
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].size.should == 2
  end

  it "should detect drupal 5" do
    result = run_matcher_on_fixture('drupal-5')
    result[:framework].should == :drupal
    result[:engine].should == :php
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].size.should == 2
  end

  it "should detect drupal 6" do
    result = run_matcher_on_fixture('drupal-6')
    result[:framework].should == :drupal
    result[:doctype].should == "html public \"-//w3c//dtd xhtml+rdfa 1.0//en\""
    result[:features].should include :jquery
    result[:features].size.should == 1
  end

  it "should detect drupal 7" do
    result = run_matcher_on_fixture('drupal-7')
    result[:framework].should == :drupal
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
  end

  it "should detect prestashop 1" do
    result = run_matcher_on_fixture('prestashop-1')
    result[:framework].should == :prestashop
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.1//en\""
  end

  it "should detect prestashop 2" do
    result = run_matcher_on_fixture('prestashop-2')
    result[:framework].should == :prestashop
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.1//en\""
  end

  it "should detect opencart 1" do
    result = run_matcher_on_fixture('opencart-1')
    result[:framework].should == :opencart
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
  end

  it "should detect opencart 2" do
    result = run_matcher_on_fixture('opencart-2')
    result[:framework].should == :opencart
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
  end

  it "should detect rails 3.1" do
    result = run_matcher_on_fixture('rails-31')
    result[:framework].should == :rails
    result[:engine].should == :ruby
    result[:features].size.should == 0
  end

  it "should detect rails 3.0 example 1" do
    result = run_matcher_on_fixture('rails-30-1')
    result[:framework].should == :rails
    result[:engine].should == :ruby
    result[:features].should include :google_analytics
    result[:features].should include :facebook
    result[:features].size.should == 2
  end

  it "should detect rails 3.0 example 2" do
    result = run_matcher_on_fixture('rails-30-2')
    result[:framework].should == :rails
    result[:engine].should == :ruby
    result[:features].should include :google_analytics
    result[:features].should include :facebook
    result[:features].size.should == 2
  end

  it "should detect rails 3.0 example 3" do
    result = run_matcher_on_fixture('rails-30-3')
    result[:framework].should == :rails
    result[:engine].should == :ruby
    result[:features].should include :google_analytics
    result[:features].should include :facebook
    result[:features].size.should == 2
  end

  it "should detect e-target 1" do
    result = run_matcher_on_fixture('etarget-1')
    result[:doctype].should == "html public \"-//w3c//dtd html 4.01 transitional//en\""
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].should include :facebook
    result[:features].should include :etarget
    result[:features].size.should == 4
  end

  it "should detect e-target 2" do
    result = run_matcher_on_fixture('etarget-2')
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 transitional//en\""
    result[:engine].should == :php
    result[:framework].should == :wordpress
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].should include :google_adsense
    result[:features].should include :facebook
    result[:features].should include :etarget
    result[:features].size.should == 5
  end

  it "should detect e-target 3" do
    result = run_matcher_on_fixture('etarget-3')
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :etarget
    result[:features].size.should == 1
  end

  it "should detect google adsense 1" do
    result = run_matcher_on_fixture('adsense-1')
    result[:doctype].should == "html"
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].should include :google_adsense
    result[:features].size.should == 3
  end

  it "should detect google adsense 2" do
    result = run_matcher_on_fixture('adsense-2')
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:features].should include :mootools
    result[:features].should include :google_analytics
    result[:features].should include :google_adsense
    result[:features].size.should == 3
  end

  it "should detect ubercart 1" do
    result = run_matcher_on_fixture('ubercart-1')
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:engine].should == :php
    result[:framework].should == :ubercart
    result[:features].should include :jquery
    result[:features].should include :google_analytics
    result[:features].size.should == 2
  end

  it "should detect ubercart 2" do
    result = run_matcher_on_fixture('ubercart-2')
    result[:doctype].should == "html public \"-//w3c//dtd xhtml 1.0 strict//en\""
    result[:engine].should == :php
    result[:framework].should == :ubercart
    result[:features].should include :google_analytics
    result[:features].size.should == 1
  end
end
