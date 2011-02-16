require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Browser < Element

        def initialize element
          if element.is_a?(Selenium::WebDriver::Driver) then
            @element = element
          elsif element.is_a?(Symbol) then
            @element = Selenium::WebDriver.for element
          else
            raise TypeError.new "Can't create Browser decorator for #{element.inspect}"
          end
          @browser = @element
        end

      end

    end
  end
end

