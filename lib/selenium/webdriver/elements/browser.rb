require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Browser < Element

        def initialize *args
          if args.length == 1 and args[1].is_a? Selenium::WebDriver::Driver
            @element = args[1]
          else
            @element = Selenium::WebDriver.for *args
          end
          @browser = @element
        end

      end

    end
  end
end

