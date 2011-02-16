require File.join(File.dirname(__FILE__), 'spec_helper.rb')

include Selenium::WebDriver::Elements

describe "Form" do

  include Aux

  it "should populate textbox" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/index_famsupp_1.html', 1, {'color' => 'red'}
  end

  it "should populate multiple textboxes" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_INPUT_TYPE_PASSWORD.html', 1, {'realname' => 'John Smith', 'mypassword' => 'qwerty'}
  end

  it "should populate checkboxes" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_INPUT_TYPE_CHECKBOX.html', 2, {'mushrooms' => true, 'greenpeppers' => false, 'olives' => true, 'onions' => false}
  end

  it "should populate textarea" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_TEXTAREA.html', 1, { 'comments' => 'bla bla bla'}
  end

  it "should populate select" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_onFocus.html', 1, { 'size' => 'm', 'phone' => '+0 123 4567890' }
  end

  it "should populate multiple select" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_MULTIPLE.html', 1, { 'toppings' => ['greenpeppers', 'tomatoes'] }
  end

  it "should populate mixed fields" do
    populate_and_check 'http://www.htmlcodetutorial.com/forms/_SELECT_TABINDEX.html', 1, \
      { 'realname' => 'John Smith', 'email' => 'smith@example.com', 'dep' => 'dev', }
  end

  def populate_and_check url, form_no, data
    @browser.navigate.to url
    form = @browser.find_elements(:tag_name => 'form')[form_no]
    form.populate(data).submit
    expect_result data
  end

end