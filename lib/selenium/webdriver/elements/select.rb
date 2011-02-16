require File.dirname(__FILE__) + '/element'

module Selenium
  module WebDriver
    module Elements

      class Select < Element

        def initialize element, browser
          super element, browser
          unless element.tag_name == 'select'
            raise TypeError.new "Can't create Select decorator for #{element.inspect}"
          end
        end

        def select_by_value value
          options = @element.find_elements :tag_name => 'option'
          options.each { |opt|
            if (opt.value == value)
                opt.select()
                break
            end
          }
        end

        def select_by_text text
          options = @element.find_elements :tag_name => 'option'
          options.each { |opt|
            if (opt.text == text)
                opt.select()
                break
            end
          }
        end

      end

    end
  end
end


