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

        def populate data
          inputs = []
          find_elements(:tag_name => 'input').each do |input|
            inputs << input if input.is_a? Textbox or input.is_a? Checkbox or input.is_a? FileChooser
          end
          inputs += find_elements :tag_name => 'textarea'
          inputs += find_elements :tag_name => 'select'

          inputs.each do |input|
            input.populate data[input['name']]
          end
          self
        end

      end

    end
  end
end


