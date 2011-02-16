require File.dirname(__FILE__) + '/element'
require 'rubygems'
require 'au3'

module Selenium
  module WebDriver
    module Elements

      class FileChooser < Element

        def initialize element, browser
          super element, browser
          unless element.tag_name == 'input' and element.attribute('type') == 'file'
            raise TypeError.new "Can't create Chooser decorator for #{element.inspect}"
          end
        end

        def choose_file filename
          case @browser.browser
            when :chrome then raise "Chrome not supported"
            else @element.send_keys filename
          end
        end

        def populate data
          if data != nil
            choose_file data
          end
        end

        def autoit
          autoit = Thread.new do
            AutoItX3::Window.wait "Open"
            dialog = AutoItX3::Window.new "Open"
            dialog.activate
            dialog.wait_active
            AutoItX3::Edit.new("Open", "", "Edit1").text = filename
            AutoItX3::Button.new("Open", "", "Button1").click
          end
          @element.click
          autoit.join
        end

      end

    end
  end
end