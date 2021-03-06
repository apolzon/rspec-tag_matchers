require 'rspec/tag_matchers/multiple_input_matcher'

module RSpec::TagMatchers
  # Matches inputs generated by Rails' +time_select+ helper.
  #
  # @example Matching a time select for an event's +start_time+
  #   it { should have_time_select.for(:event => :start_time) }
  #
  # @return [HasTimeSelect]
  def have_time_select
    HasTimeSelect.new
  end

  # A matcher that matches Rails' +time_select+ drop-downs.
  class HasTimeSelect < MultipleInputMatcher

    # Initializes a HasTimeSelect matcher.
    def initialize
      super('4i' => HasSelect.new, '5i' => HasSelect.new)
    end

    # Returns a description of the matcher's criteria.
    #
    # @return [String]
    def description
      [basic_description, extra_description].compact.join(" ")
    end

    # Returns an explanation of why the matcher failed to match with +should+.
    #
    # @return [String]
    def failure_message
      "expected document to #{description}; got: #{@rendered}"
    end

    # Returns an explanation of why the matcher failed to match with +should_not+.
    #
    # @return [String]
    def negative_failure_message
      "expected document to not #{description}; got: #{@rendered}"
    end

    private

    # Returns a basic description.
    #
    # @return [String]
    def basic_description
      "have time select"
    end

    # Provides an extra description fragment that can be appended to the basic description.
    #
    # @return [String]
    def extra_description
      "for #{@for.join(".")}" if @for
    end

  end
end
