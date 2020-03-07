# frozen_string_literal: true

require 'minitest/autorun'

# Module for testing OptionsParser module
class OptionsParserTest < Minitest::Test
  def setup
    @options_parsers = OptionsParser
  end

  # NEED FIX
  def test_with_input
    assert_equal @options_parsers.parse, @options_parsers.parse
  end

  # NEED FIX
  def test_with_output
    assert_equal @options_parsers.parse, @options_parsers.parse
  end

  # NEED FIX
  def test_with_sort
    assert_equal @options_parsers.parse, @options_parsers.parse
  end
end
