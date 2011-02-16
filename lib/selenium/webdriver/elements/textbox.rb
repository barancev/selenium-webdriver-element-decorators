require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Textbox < Element

        def initialize element, browser
          super element, browser
          unless element.tag_name == 'input' or element.tag_name == 'textarea'
            raise TypeError.new "Can't create Textbox decorator for #{element.inspect}"
          end
        end

        def type *args
          if @browser.browser == :chrome
            @element.click
          end
          @element.clear
          @element.send_keys *args
        end

        def append *args
          if @browser.browser == :chrome
            @element.click
          end
          @element.send_keys *args
        end

        def populate data
          if data != nil
            type data
          end
        end

      end

    end
  end
end


