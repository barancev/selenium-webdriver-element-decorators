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

        def select_by_value selection
          if selection.is_a?(Array)
            unless @element['multiple']
              raise "Attempt to select multiple values in a listbox with single selection mode"
            end
            options = @element.find_elements :tag_name => 'option'
            options.each do |opt|
              if (selection.include? opt.value)
                opt.select unless opt.selected?
              else
                opt.toggle if opt.selected?
              end
            end
          else
            options = @element.find_elements :tag_name => 'option'
            options.each do |opt|
              if (opt.value == selection)
                  opt.select
                  break
              end
            end
          end
        end

        def select_by_text selection
          if selection.is_a?(Array)
            unless @element['multiple']
              raise "Attempt to select multiple values in a listbox with single selection mode"
            end
            options = @element.find_elements :tag_name => 'option'
            options.each do |opt|
              if (selection.include? opt.text)
                opt.select unless opt.selected?
              else
                opt.toggle if opt.selected?
              end
            end
          else
            options = @element.find_elements :tag_name => 'option'
            options.each do |opt|
              if (opt.text == selection)
                  opt.select
                  break
              end
            end
          end
        end

      end

      def populate data
        if data != nil
          select_by_value data
        end
      end

    end
  end
end


