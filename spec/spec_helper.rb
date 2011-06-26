$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'simplecov'
SimpleCov.start
require 'rack'
require 'rack/lettering'
require 'rspec'
require 'nokogiri'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end

RSpec::Matchers.define :have_css_selector do |selector|

  match do |document|
    @doc = document
    @doc.css(selector).size > 0
  end

  description do
    "have_css_selector :#{selector}"
  end

  failure_message_for_should do |text|
    "have_css_selector expected #{@doc} to have selector: #{selector}"
  end

  failure_message_for_should_not do |text|
    "have_css_selector expected #{@doc} not to have selector: #{selector}"
  end
end