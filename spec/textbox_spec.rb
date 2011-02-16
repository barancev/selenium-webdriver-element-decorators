require File.join(File.dirname(__FILE__), 'spec_helper.rb')

include Selenium::WebDriver::Elements

describe "Form" do

  include Aux

  before(:each) do
    @browser.navigate.to 'http://www.htmlcodetutorial.com/forms/index_famsupp_1.html'
  end

  def form
    res = @browser.find_elements(:tag_name => 'form')[1]
    res
  end

  it "should recognize forms" do
    form.should be_kind_of Form
  end

  it "should submit form" do
    form.submit
    expect_result({'color' => ''})
  end

  it "should populate form" do
    data = {'color' => 'red'}
    form.populate(data).submit
    expect_result( data )
  end

end