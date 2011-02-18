require File.join(File.dirname(__FILE__), 'spec_helper.rb')

include Selenium::WebDriver::Elements

describe "Form" do

  include Aux

  it "should populate textbox" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/index_famsupp_1.html', {'color' => 'red'}
  end

  it "should populate multiple textboxes" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_INPUT_TYPE_PASSWORD.html', {'realname' => 'John Smith', 'mypassword' => 'qwerty'}
  end

  it "should populate checkboxes" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_INPUT_TYPE_CHECKBOX.html', {'mushrooms' => true, 'greenpeppers' => false, 'olives' => true, 'onions' => false}, 1
  end

  it "should populate textarea" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_TEXTAREA.html',{ 'comments' => 'bla bla bla'}
  end

  it "should populate select" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_onFocus.html', { 'size' => 'm', 'phone' => '+0 123 4567890' }
  end

  it "should populate multiple select" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_MULTIPLE.html', { 'toppings' => ['greenpeppers', 'tomatoes'] }
  end

  it "should populate mixed fields" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_TABINDEX.html', { 'realname' => 'John Smith', 'email' => 'smith@example.com', 'dep' => 'dev', }
  end

  def populate_and_check url, data, form_no = 0
    @browser.navigate.to url
    form = @browser.find_element(:id => 'content').find_elements(:tag_name => 'form')[form_no]
    form.populate(data).submit
    expect_result data
  end

end