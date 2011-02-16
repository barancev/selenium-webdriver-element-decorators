require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Checkbox < Element

        def check state = 'on'
          if @element.selected? != state
            @element.toggle
          end
        end

        def uncheck
          check 'off'
        end

        def populate data
          if data != nil
            check data
          end
        end

      end

    end
  end
end


