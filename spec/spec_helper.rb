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

module Aux

  def expect_result params
    params.keys.each do |key|
      params[key] = 'on' if params[key] == true
      params.delete(key) if params[key] == false
    end
    params.should eq results
  end

  def results
    res = {}
    table = @browser.find_elements(:tag_name => 'table')[1]
    rows = table.find_elements :tag_name => 'tr'
    name = nil
    rows.each do |r|
      name_cell = r.find_element(:tag_name => 'th')
      name = name_cell.text unless name_cell == nil
      if res[name] == nil
        res[name] = r.find_element(:tag_name => 'td').text
      else
        unless res[name].is_a? Array
          res[name] = [ res[name] ]
        end
        res[name] << r.find_element(:tag_name => 'td').text
      end
    end
    res
  end

end