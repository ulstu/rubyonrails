# frozen_string_literal: true

require 'minitest/autorun'

# Module for testing OptionsParser module
class AtomParserTest < Minitest::Test
  def setup
    @atom_parser = AtomParser
  end

  def test_atom_format
    hash = {
      'title' => 'Example Feed',
      'link' => { '@href' => 'http://example.org/' },
      'author' => [{ 'name' => 'John Doe' }]
    }

    string = '<feed xmlns="http://www.w3.org/2005/Atom">'\
                '<title>Example Feed</title>'\
                '<link href="http://example.org/"/>'\
                '<author>'\
                  '<name>John Doe</name>'\
                '</author>'\
              '</feed>'
    assert_equal hash, @atom_parser.parse(string)
  end
end
