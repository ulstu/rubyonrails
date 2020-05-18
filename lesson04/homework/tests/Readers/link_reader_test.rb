# frozen_string_literal: true

require 'minitest/autorun'
require 'open-uri'
# Module for testing OptionsParser module
class LinkReaderTest < Minitest::Test
  def setup
    @link_reader = LinkReader
  end

  def test_tom_uri
    tom_uri = 'http://tim.org'
    assert_equal URI.parse(tom_uri).read, @link_reader.read(tom_uri)
  end

  def test_spork_uri
    spork_uri = 'https://spork.org'
    assert_equal URI.parse(spork_uri).read, @link_reader.read(spork_uri)
  end

  # need add empty test
  def test_empty_uri
    skip
  end
end
