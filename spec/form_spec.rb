require File.join(File.dirname(__FILE__), 'spec_helper.rb')

include Selenium::WebDriver::Elements

describe "Browser" do

  before(:each) do
    @browser.navigate.to 'http://www.google.com/ncr'
  end

  it "should load pages" do
    @browser.title.should eq "Google"
  end

  it "should find single element" do
    logo = @browser.find_element :id => "hplogo"
    logo.attribute("alt").should eq "Google"
  end

  it "should find several elements" do
    links = @browser.find_elements :class => "gb1"
    links.length.should eq 7
  end

  it "should type in textbox" do
    textbox = @browser.find_element :name => "q"
    textbox.should be_kind_of Textbox
    textbox.type "Ruby", :enter
    textbox.value.should eq "Ruby"
  end

  it "should select from list" do
    textbox = @browser.find_element :name => "q"
    textbox.type "Ruby", :enter

    @browser.find_element(:link => "Shopping").click
    list = @browser.find_element :id => "ps_sort"
    list.select_by_text "Price: high to low"
  end

end