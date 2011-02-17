require 'rubygems'
require 'selenium/webdriver'

module Selenium
  module WebDriver
    module Elements

      class Element

        def initialize element, browser
          unless element.is_a? Selenium::WebDriver::Element
            raise TypeError.new "Can't create Element decorator for #{element.inspect}"
          end
          @element = element
          @browser = browser
        end

        def method_missing methodname, *args
          @element.send methodname.to_sym, *args
        end

        def create_element element, browser
          case element.tag_name
            when 'form' then Form.new element, browser
            when 'input' then
              type = element['type']
              case element['type']
                when 'text', 'password' then Textbox.new element, browser
                when 'submit', 'reset', 'button', 'image' then Button.new element, browser
                when 'checkbox' then Checkbox.new element, browser
                when 'file' then FileChooser.new element, browser
                # TODO: implement radio buttons
                #when 'radio' then Element.new element, browser
                else Element.new element, browser
              end
            when 'textarea' then Textbox.new element, browser
            when 'select' then Select.new element, browser
            else Element.new element, browser
          end
        end

        def find_element *args
          begin
            el = @element.find_element *args
            create_element(el, @browser)
          rescue Selenium::WebDriver::Error::NoSuchElementError
            nil
          end
        end

        def find_elements *args
          @element.find_elements(*args).collect { |el| create_element el, @browser }
        end

        def element_present? *args
          find_element(*args) != nil
        end

      end

      def send_keys *args
        # ----- workaround -----
        # see http://code.google.com/p/selenium/issues/detail?id=440
        if @browser.browser == :chrome
          @element.click
        end
        # ----- workaround -----
        @element.send_keys *args
      end

    end

  end
end
