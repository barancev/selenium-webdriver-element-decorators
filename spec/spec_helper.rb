$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'selenium/webdriver'
require 'selenium/webdriver/elements'

include Selenium::WebDriver::Elements

RSpec.configure do |c|

  c.before(:all) do
    @browser = Browser.new :firefox
  end

  c.after(:all) do
    @browser.quit
  end

end
