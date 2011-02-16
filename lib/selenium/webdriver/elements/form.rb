require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Form < Element

        def initialize element, browser
          super element, browser
          unless element.tag_name == 'form'
            raise TypeError.new "Can't create Form decorator for #{element.inspect}"
          end
        end

        def populate

        end

      end

    end
  end
end


