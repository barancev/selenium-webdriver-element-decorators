require File.join(File.dirname(__FILE__), 'spec_helper.rb')

include Selenium::WebDriver::Elements

describe "Form" do

  include Aux

  before(:each) do
    @browser.navigate.to 'http://www.htmlcodetutorial.com/forms/_INPUT_TYPE_TEXT.html'
  end

  def form
    @browser.find_elements(:tag_name => 'form')[1]
  end

  def textbox
    form.find_element(:name => 'realname')
  end

  it "should recognize textboxes" do
    textbox.should be_kind_of Textbox
  end

  it "should type into textbox" do
    textbox.type 'foo'
    textbox.value.should eq 'foo'
  end

  it "should clear textbox when typing" do
    textbox.type 'foo'
    textbox.value.should eq 'foo'
    textbox.type 'bar'
    textbox.value.should eq 'bar'
  end

  it "should not clear textbox when appending" do
    textbox.type 'foo'
    textbox.value.should eq 'foo'
    textbox.append 'bar'
    textbox.value.should eq 'foobar'
  end

  it "should submit textbox value" do
    textbox.type 'foo'
    form.submit
    expect_result( {'realname' => 'foo'} )
  end

end