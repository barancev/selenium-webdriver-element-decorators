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
              case element.attribute('type')
                when 'file' then FileChooser.new element, browser
                else Textbox.new element, browser
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
          @element.find_elements(*args).collect { |el| Element.new el, @browser }
        end

        def element_present? *args
          find_element(*args) != nil
        end

        def find_select *args
          begin
            Select.new(@element.find_element *args)
          rescue Selenium::WebDriver::Error::NoSuchElementError
            nil
          end
        end

        def find_file_chooser *args
          begin
            FileChooser.new(@element.find_element *args)
          rescue Selenium::WebDriver::Error::NoSuchElementError
            nil
          end
        end

      end

      def send_keys *args
        if @browser.browser == :chrome
          @element.click
        end
        @element.send_keys *args
      end

    end
  end
end
